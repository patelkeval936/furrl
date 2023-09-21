import 'package:flutter/material.dart';
import '../../../values/app_assets.dart';
import '../../../values/app_constants.dart';

class FramePostCard extends StatelessWidget {
  const FramePostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.asset(
            AppAssets.framePicture,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 16,
          right: 16,
          child: Container(
            width: width,
            height: width * 0.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.black87, Colors.black.withOpacity(0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                  height: 44,
                  width: 44,
                  child: Image.asset(
                    'assets/images/story2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wade Warren",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, height: 1.5),
                  ),
                  Text(
                    "IG: 1M Follower",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 12,
          right: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.iconButtonBackground,
                child: Image.asset(
                  AppAssets.bagIcon,
                  width: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              CircleAvatar(
                backgroundColor: AppColors.iconButtonBackground,
                child: Image.asset(
                  AppAssets.wishlistIcon,
                  width: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
