import 'package:flutter/material.dart';
import 'package:furrl/presentation/edit_frame/components/custom_app_bar.dart';
import 'package:furrl/presentation/frames_page/components/product_detail_and_tags.dart';
import 'package:furrl/presentation/frames_page/components/product_frame.dart';

import '../../values/app_enums.dart';
import '../../values/app_strings.dart';
import 'components/name_header.dart';

class FramesPage extends StatelessWidget {
  static const id = 'frames_page';

  const FramesPage({Key? key, required this.frameType, required this.framePath}) : super(key: key);

  final String framePath;
  final FrameType frameType;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(AppStrings.jennysFrame),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              const NameHeader(),
              const ProductDetailAndTags(),
              ProductFrame(framePath: framePath, frameType: frameType),
              const SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }
}
