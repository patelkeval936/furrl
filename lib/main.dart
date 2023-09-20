import 'package:flutter/material.dart';
import 'package:furrl/presentation/edit_frame/edit_frame.dart';
import 'package:furrl/values/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: EditFrame(),
    );
  }
}

