import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
 static  TextStyle latoTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
