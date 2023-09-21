import 'package:flutter/material.dart';
import '../../../values/app_assets.dart';

class CustomAppBar extends AppBar {

   CustomAppBar(this.appBarTitle, {super.key}) : super(
    title:  Text(appBarTitle),
    actions: [
      IconButton(
        constraints: const BoxConstraints(maxWidth: 50),
          splashRadius: 26,
          onPressed: () {},
          icon: Image.asset(
            AppAssets.searchIcon,
            width: 20,
          )),
      IconButton(
          onPressed: () {},
          splashRadius: 26,
          constraints: const BoxConstraints(maxWidth: 50),
          icon: Image.asset(
            AppAssets.wishlistIcon,
            width: 20,
          )),
      IconButton(
          onPressed: () {},
          splashRadius: 26,
          constraints: const BoxConstraints(maxWidth: 50),
          icon: Image.asset(
            AppAssets.bagIcon,
            width: 20,
          )),
    ],
  );

  final String appBarTitle;

}