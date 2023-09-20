import 'package:flutter/material.dart';

Size screenSize = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
double devicePixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
double width = screenSize.width/devicePixelRatio;
double height = screenSize.height/devicePixelRatio;