

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/features/auth/data/models/on_boarding_model.dart';
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
            onPressed: () {},
            child: Text(
              AppString.skip,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.white.withOpacity(
                  .5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Image.asset(
          onBoardingModel.image,
        ),
        const SizedBox(
          height: 16,
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
        const SizedBox(
          height: 50,
        ),
        Text(
          onBoardingModel.title,
          style: GoogleFonts.lato(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColor.white,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Text(
            onBoardingModel.subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
