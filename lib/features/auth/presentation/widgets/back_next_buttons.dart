import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';

class BackNextButtons extends StatelessWidget {
  const BackNextButtons({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        controller.page != 0
            ? TextButton(
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(
                      milliseconds: 100,
                    ),
                    curve: Curves.linear,
                  );
                },
                child: Text(
                  AppString.back,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.white.withOpacity(
                      .5,
                    ),
                  ),
                ),
              )
            : Container(),
        const Spacer(
          flex: 8,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
              90,
              48,
            ),
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4,
              ),
            ),
          ),
          onPressed: () {
            controller.nextPage(
              duration: const Duration(
                milliseconds: 100,
              ),
              curve: Curves.linear,
            );
          },
          child: Text(
            controller.page != 2 ? AppString.next : AppString.getStarted,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColor.white,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
