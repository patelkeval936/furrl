import 'dart:io';
import 'package:flutter/material.dart';
import '../../../values/app_constants.dart';
import '../../../values/app_enums.dart';
import '../../../values/app_strings.dart';
import '../../edit_frame/edit_frame.dart';
import '../../home_page/home_page.dart';

class ProductFrame extends StatelessWidget {
  const ProductFrame({Key? key, required this.framePath, required this.frameType}) : super(key: key);

  final String framePath;
  final FrameType frameType;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              AppStrings.yourFrames,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:

            frameType == FrameType.preSaved ? Image.asset(framePath,
              fit: BoxFit.fitWidth,
              width: width,) : Image.file(File(framePath,),fit: BoxFit.fitWidth,width: width,),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0, left: 16, right: 16,top: 12),
            child: Center(
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(EditFrame.id);
                  },
                  child: Text(
                    AppStrings.editFrames,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryColor),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16,top: 12),
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.id);
                  },
                  child: Text(
                    AppStrings.goToHomePage,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
