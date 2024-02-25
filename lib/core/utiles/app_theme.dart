import 'package:flutter/material.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_text_style.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.backGround,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColor.backGround,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyle.latoTextStyle(
          16,
          FontWeight.w400,
          AppColor.white,
        ),
        fillColor: AppColor.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
      ),
    );
  }
}
