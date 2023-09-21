import 'dart:ui';
import 'package:furrl/presentation/edit_frame/model/image_data.dart';

class EditFrameState {
  int? selectedIndex;
  bool moveImage = true;
  List<FrameImageData> images = [];
  Size originalSize = const Size(0, 0);

  EditFrameState({
    required this.images,
    required this.selectedIndex,
    required this.moveImage,
    required this.originalSize,
  });

  EditFrameState copyWith({List<FrameImageData>? images, int? selectedIndex, bool? moveImage, Size? originalSize}) {
    return EditFrameState(
      images: images ?? this.images,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      moveImage: moveImage ?? this.moveImage,
      originalSize: originalSize ?? this.originalSize,
    );
  }
}
