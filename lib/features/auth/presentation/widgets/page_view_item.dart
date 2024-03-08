import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/core/utiles/app_text_style.dart';
import 'package:notes_app/features/auth/data/models/on_boarding_model.dart';
import 'package:notes_app/features/home/presentation/views/home_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key, required this.onBoardingModel, required this.controller});
  final OnBoardingModel onBoardingModel;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return const HomeView();
                  },
                ),
              );
            },
            child: Text(
              AppString.skip,
              style: AppTextStyle.latoTextStyle(
                16,
                FontWeight.w400,
                AppColor.white.withOpacity(
                  .5,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Image.asset(
          onBoardingModel.image,
        ),
        SizedBox(
          height: 16.h,
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: const WormEffect(
            dotHeight: 7,
            dotWidth: 45,
            activeDotColor: AppColor.white,
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Text(
          onBoardingModel.title,
          style: AppTextStyle.latoTextStyle(
            32,
            FontWeight.w400,
            AppColor.white,
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Text(
            onBoardingModel.subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.latoTextStyle(
              16,
              FontWeight.w400,
              AppColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
