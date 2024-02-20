import 'package:flutter/material.dart';
import 'package:notes_app/core/utiles/app_color.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.backGround,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColor.backGround,
      ),
    );
  }
}
