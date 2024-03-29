import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
 static  TextStyle latoTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return GoogleFonts.lato(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
