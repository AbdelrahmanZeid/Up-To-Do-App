import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/core/utiles/app_color.dart';

void showToast({required String message, required ToastStates states}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: toastColor(
        states,
      ),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { success, error, wrining }

Color toastColor(ToastStates states) {
  switch (states) {
    case ToastStates.error:
      return AppColor.red;
    case ToastStates.success:
      return AppColor.primary;
    case ToastStates.wrining:
      return AppColor.orange;
  }
}
