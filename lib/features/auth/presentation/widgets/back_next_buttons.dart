import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/database/cache_helper.dart';
import 'package:notes_app/core/services/service_locator.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/features/home/presentation/views/home_view.dart';

class BackNextButtons extends StatelessWidget {
  const BackNextButtons({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
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
        ),
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
            getIt<CacheHelper>()
                .saveData(
              key: AppString.onBoardingKey,
              value: true,
            )
                .then(
              (
                value,
              ) {
                if (kDebugMode) {
                  print(
                    "app created",
                  );
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      _,
                    ) {
                      return const HomeView();
                    },
                  ),
                );
              },
            ).catchError(
              (e) {
                print(
                  e.toString(),
                );
              },
            );
          },
          child: Text(
            AppString.getStarted,
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
