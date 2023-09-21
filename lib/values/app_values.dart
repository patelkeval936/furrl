import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:furrl/presentation/frames_page/model/frame_data.dart';
import 'package:furrl/values/app_assets.dart';


FrameData frameData = FrameData(
  'Jenny',
  'Wilson',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod.',
  ['Organic', 'ClassyAffair', 'MultiColor', "OverSized", 'Miminalism'],
  AppAssets.framePicture,
);

List offers = [
  'Free Delivery Above INR 499',
  'Verified Instagram Brands',
  "Hassle Free Returns & Exchange",
  '3 Day Express Delivery',
];

final GlobalKey globalKey = GlobalKey();

String androidDirPath = '/storage/emulated/0/Download';

Size screenSize = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
double devicePixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
double width = screenSize.width / devicePixelRatio;
double height = screenSize.height / devicePixelRatio;