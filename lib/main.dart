import 'package:flutter/material.dart';
import 'package:furrl/router/app_router.dart';
import 'package:furrl/values/app_strings.dart';
import 'package:furrl/values/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.getAppTheme(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        return AppRouter.generateRoutes(settings);
      },
    );
  }
}
