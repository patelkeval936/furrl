
import 'package:flutter/material.dart';
import '../../../values/app_constants.dart';
import '../../../values/app_strings.dart';

class PickImages extends StatelessWidget {
  const PickImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(AppStrings.tapAnywhere),
          )
        ],
      ),
    );
  }
}