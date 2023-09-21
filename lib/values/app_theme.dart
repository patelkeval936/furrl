import 'package:flutter/material.dart';
import 'package:furrl/values/app_constants.dart';

import 'app_values.dart';

class AppTheme {

  static ThemeData themeData = ThemeData(

    fontFamily: 'inclusiveSans',

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size(width, 46)),
        side: MaterialStatePropertyAll(BorderSide(color: AppColors.primaryColor)),
        foregroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        fixedSize: MaterialStatePropertyAll(Size(width, 46)),
        side: MaterialStatePropertyAll(BorderSide(color: AppColors.primaryColor)),
        foregroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
      ),
    ),

    iconButtonTheme: const IconButtonThemeData(

      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(20, 20),
        ),
        maximumSize: MaterialStatePropertyAll(Size(26, 26))
      ),
    ),
  );
}
