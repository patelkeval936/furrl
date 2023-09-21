
import 'package:flutter/material.dart';

import '../../../values/app_constants.dart';
import 'frame_post_card.dart';

class FramePost extends StatelessWidget {
  const FramePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: Colors.white,
        width: width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Text(
                '#DailyEthnic',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            const FramePostCard(),
          ],
        ),
      ),
    );
  }
}
