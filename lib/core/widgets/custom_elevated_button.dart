import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/utiles/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.color, required this.onPressed, required this.text, required this.fontSize, required this.btnWidth, required this.btnHeight});
  final Color color;
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final double btnWidth;
  final double btnHeight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          btnWidth,
          btnHeight,
        ),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.lato(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: AppColor.white,
        ),
      ),
    );
  }
}
