import 'dart:io';
import 'dart:ui' as ui;
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:furrl/presentation/edit_frame/model/image_data.dart';
import 'package:furrl/values/app_strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import '../../../values/app_enums.dart';
import '../../../values/app_values.dart';
import '../presentation/frames_page/frames_page.dart';
import 'edit_frame_state.dart';

class EditFrameCubit extends Cubit<EditFrameState> {
  EditFrameCubit()
      : super(EditFrameState(
          images: [],
          selectedIndex: null,
          moveImage: true,
          originalSize: const Size(0, 0),
        ));

  Future<void> pickImages(double width) async {
    if (state.images.isEmpty) {
      final ImagePicker picker = ImagePicker();

      List<XFile> pickedImages = await picker.pickMultiImage();

      pickedImages = pickedImages.sublist(0, pickedImages.length > 6 ? 6 : pickedImages.length);
      for (var image in pickedImages) {
        image.readAsBytes().then((value) {
          int index = pickedImages.indexOf(image);
          state.images.add(FrameImageData(
            image: Image.memory(value),
            size: Size(width * 0.5, width * 0.5),
            left: index % 2 * width * 0.5,
            top: index / 2 * width * 0.5,
          ));
          emit(state.copyWith(images: state.images));
        });
      }
    }
  }

  void getSelectedImageIndex({required double top, required double left}) {
    for (FrameImageData image in state.images) {
      if (image.left < left && left < image.left + image.size.width && image.top < top && top < image.top + image.size.height) {
        state.selectedIndex = state.images.indexOf(image);

        state.images.add(image);
        state.images.removeAt(state.selectedIndex!);

        state.originalSize = image.size;
        state.selectedIndex = state.images.length - 1;

        emit(state.copyWith(selectedIndex: state.selectedIndex));

        break;
      } else {
        state.selectedIndex = null;
        emit(state.copyWith(selectedIndex: state.selectedIndex));
      }
    }
  }

  void zoomInOutOrMoveImage(ScaleUpdateDetails details) {
    if (state.selectedIndex != null) {
      if (state.moveImage && details.pointerCount == 1) {
        state.images[state.selectedIndex!].left = details.localFocalPoint.dx - (state.images[state.selectedIndex!].size.width / 2);
        state.images[state.selectedIndex!].top = details.localFocalPoint.dy - (state.images[state.selectedIndex!].size.height / 2);

        emit(state.copyWith(images: state.images));
      } else if (details.pointerCount == 2) {
        if (details.verticalScale > 0.5 && details.verticalScale < 3) {
          state.images[state.selectedIndex!].size = Size(state.originalSize.width * details.scale, state.originalSize.height * details.scale);

          state.images[state.selectedIndex!].left = details.localFocalPoint.dx - (state.images[state.selectedIndex!].size.width / 2);
          state.images[state.selectedIndex!].top = details.localFocalPoint.dy - (state.images[state.selectedIndex!].size.height / 2);
          emit(state.copyWith(images: state.images));
        }
        state.moveImage = false;
      }
    }
  }

  void changeMoveImageTo(bool value) {
    state.moveImage = value;
    emit(state.copyWith(moveImage: state.moveImage));
  }

  Future<Uint8List?> captureImageFromFrame() async {
    try {
      RenderRepaintBoundary? boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image? image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  void saveImage(BuildContext context) async {
    Uint8List? imageBytes = await captureImageFromFrame();

    Directory? downloadsDir;

    if (Platform.isAndroid) {
      downloadsDir = Directory(androidDirPath);
    } else {
      downloadsDir = await getApplicationDocumentsDirectory();
    }

    Uri uri = Uri.parse("${downloadsDir.path}/${DateTime.now().millisecondsSinceEpoch}.png");

    File imageFile = File.fromUri(uri);

    imageFile.writeAsBytes(imageBytes?.toList() ?? []).whenComplete(() {
      showImageSavedDialog(context, uri);
    });
  }

  void showImageSavedDialog(BuildContext context, Uri uri) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.imageSavedSuccessfully),
          content: const Text(
            AppStrings.findInFileManager,
            textAlign: TextAlign.center,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => FramesPage(frameType: FrameType.currentlyMade, framePath: uri.path),
                    ),
                  );
                },
                child: const Text(
                  AppStrings.seeFrame,
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }
}
