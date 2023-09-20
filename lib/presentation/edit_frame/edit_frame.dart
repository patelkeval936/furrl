import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:furrl/values/app_assets.dart';
import 'package:furrl/values/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../values/app_strings.dart';
import '../../values/app_values.dart';
import 'model/image_data.dart';

class EditFrame extends StatefulWidget {
  @override
  State<EditFrame> createState() => _EditFrameState();
}

class _EditFrameState extends State<EditFrame> {
  List<ImageData> images = [
    // ImageData(Image.asset(AppAssets.bagIcon), 100, 100, 0,0,Colors.red),
    // ImageData(Image.asset(AppAssets.bagIcon), 100, 100, 20,100,Colors.green),
    // ImageData(Image.asset(AppAssets.bagIcon), 100, 100, 50,50,Colors.blue),
    // ImageData(Image.asset(AppAssets.bagIcon), 100, 100, 90,200,Colors.orange),
  ];

  // double left = 0;
  // double top = 0;

  Size originalSize = Size(0, 0);

  int? selectedIndex;
  int previousPointers = 0;

  GlobalKey globalKey = GlobalKey();

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();

    final List<XFile> pickedImages = await picker.pickMultiImage();
    pickedImages.forEach((element) {
      element.readAsBytes().then((value) {
        setState(() {
          images.add(ImageData(Image.memory(value), Size(width * 0.5, width * 0.5), 40, 40, Colors.redAccent));
        });
      });
    });
  }

  Future<Uint8List?> captureImage() async {
    try {
      RenderRepaintBoundary? boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image? image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes ?? []);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return null;
  }

  void saveImage()async{
    Uint8List? imageBytes = await captureImage();

    Directory? downloadsDir;

    if(Platform.isAndroid){
      downloadsDir = Directory('/storage/emulated/0/Download');
      // downloadsDir = await getExternalStorageDirectory();
    }else{
      downloadsDir = await getApplicationDocumentsDirectory();
    }

    // final Directory? downloadsDir = await getDownloadsDirectory();
    // final Directory? downloadsDir = await getExternalStorageDirectory();

    print(downloadsDir?.path);

    Uri uri = Uri.parse("${downloadsDir?.path}/${DateTime.now().millisecondsSinceEpoch}.png");

    print(uri.path);

    if(downloadsDir != null){
      File imageFile = File.fromUri(uri);
      imageFile.writeAsBytes(imageBytes?.toList() ?? []).whenComplete(() {
        showDialog(context: context, builder: (context) {
          return const AlertDialog(
            title: Text('Image Saved Successfully'),
          );
        },);
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.editFrame),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.searchIcon,
                height: 24,
                width: 24,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.wishlistIcon,
                height: 24,
                width: 24,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.bagIcon,
                height: 24,
                width: 24,
              )),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: ClipRRect(
              child: GestureDetector(
                onTap: () {
                  if (images.length == 0) {
                    pickImages();
                  }
                },
                onScaleStart: (details) {
                  // print('on tap down $selectedIndex');

                  double left = details.localFocalPoint.dx;
                  double top = details.localFocalPoint.dy;

                  for (ImageData image in images) {
                    if (image.left < left && left < image.left + image.size.width && image.top < top && top < image.top + image.size.height) {
                      selectedIndex = images.indexOf(image);

                      images.add(image);
                      images.removeAt(selectedIndex!);

                      setState(() {
                        selectedIndex = images.length - 1;
                      });
                      originalSize = image.size;
                      break;
                    } else {
                      selectedIndex = null;
                    }
                  }
                },
                onTapDown: (details) {
                  // print('on tap down $selectedIndex');
                  double left = details.localPosition.dx;
                  double top = details.localPosition.dy;
                  previousPointers = 1;
                  for (ImageData image in images) {
                    if (image.left < left && left < image.left + image.size.width && image.top < top && top < image.top + image.size.height) {
                      selectedIndex = images.indexOf(image);

                      // print('changing selected index from on scale start $selectedIndex');

                      images.add(image);
                      images.removeAt(selectedIndex!);

                      setState(() {
                        selectedIndex = images.length - 1;
                      });

                      originalSize = image.size;
                      break;
                    } else {
                      selectedIndex = null;
                    }
                  }
                },
                onScaleUpdate: (details) {
                  if (selectedIndex != null) {
                    if (details.pointerCount == 2) {
                      setState(() {
                        if (details.verticalScale > 0.5 && details.verticalScale < 3) {
                          images[selectedIndex!].size = Size(originalSize.width * details.scale, originalSize.height * details.scale);

                          images[selectedIndex!].left = details.localFocalPoint.dx - (images[selectedIndex!].size.width / 2);
                          images[selectedIndex!].top = details.localFocalPoint.dy - (images[selectedIndex!].size.height / 2);
                        }
                      });

                      previousPointers = 2;
                    } else if (previousPointers == 1) {
                      setState(() {
                        images[selectedIndex!].left = details.localFocalPoint.dx - (images[selectedIndex!].size.width / 2);
                        images[selectedIndex!].top = details.localFocalPoint.dy - (images[selectedIndex!].size.height / 2);
                      });
                    }
                  }
                },
                child: RepaintBoundary(
                  key: globalKey,
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      color: AppConstants.primaryColor.withOpacity(0.06),
                      child: SizedBox(
                        height: height * 0.7,
                        width: width,
                        child: images.length == 0
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        color: Colors.white,
                                      ),
                                      radius: 26,
                                      backgroundColor: AppConstants.primaryColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Text(AppStrings.tapAnywhere),
                                    )
                                  ],
                                ),
                              )
                            : Stack(
                                children: [
                                  ...images.map((e) => Positioned(
                                        top: e.top,
                                        left: e.left,
                                        child: SizedBox(
                                          height: e.size.height,
                                          width: e.size.width,
                                          child: e.image,
                                        ),
                                      ))
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: ElevatedButton(
                onPressed: () {
                  saveImage();
                },
                child: Text(
                  AppStrings.save,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  AppStrings.cancel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppConstants.primaryColor),
                )),
          )
        ]),
      ),
    );
  }
}
