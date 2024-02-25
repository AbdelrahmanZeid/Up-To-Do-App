
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/utiles/app_assets.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';

class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.noTask,
        ),
        Text(
          AppString.noTask,
          style: GoogleFonts.lato(fontSize: 24, color: AppColor.white),
        ),
        Text(
          AppString.noTask2,
          style: GoogleFonts.lato(
            fontSize: 16,
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}
