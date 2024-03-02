import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/database/cache_helper.dart';
import 'package:notes_app/core/services/service_locator.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/core/utiles/app_text_style.dart';
import 'package:notes_app/core/widgets/custom_elevated_button.dart';
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
            style: AppTextStyle.latoTextStyle(
              16,
              FontWeight.w400,
              AppColor.white.withOpacity(
                .5,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 8,
        ),
        CustomElevatedButton(
          color: AppColor.primary,
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
                Navigator.pushReplacement(
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
          text: AppString.getStarted,
          fontSize: 16.sp,
          btnWidth: 90.w,
          btnHeight: 48.h,
        ),
        const Spacer(),
      ],
    );
  }
}
