
import 'package:flutter/material.dart';
import 'package:furrl/values/app_constants.dart';

import 'app_values.dart';

class AppTheme{
  static ThemeData themeData =
  ThemeData(
    fontFamily: 'inclusiveSans',
    colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.primaryColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1
      // color: Colors.white
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size(width,46)),
        side: MaterialStatePropertyAll(BorderSide(color: AppConstants.primaryColor)),
        foregroundColor: MaterialStatePropertyAll(AppConstants.primaryColor)
      )
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
            fixedSize: MaterialStatePropertyAll(Size(width,46)),
            side: MaterialStatePropertyAll(BorderSide(color: AppConstants.primaryColor)),
            foregroundColor: MaterialStatePropertyAll(AppConstants.primaryColor)
        )
    )
  );

}