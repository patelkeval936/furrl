import 'package:flutter/material.dart';
import 'package:furrl/presentation/edit_frame/model/image_data.dart';

class ImagesFrame extends StatelessWidget {
  const ImagesFrame({
    super.key,
    required this.images,
  });

  final List<FrameImageData> images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...images.map((e) => Positioned(
          top: e.top,
          left: e.left,
          child: Container(
            color: Colors.red,
            child: SizedBox(
              width: e.size.width,
              child: e.image,
            ),
          ),
        ))
      ],
    );
  }
}