import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/database/cache_helper.dart';
import 'package:notes_app/core/services/service_locator.dart';
import 'package:notes_app/core/utiles/app_assets.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/features/auth/presentation/views/on_boarding_view.dart';
import 'package:notes_app/features/home/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void delayedNavigate() {
    bool isVisted = getIt<CacheHelper>().getData(
      key: AppString.onBoardingKey,
    )??false;
     Future.delayed(
            const Duration(
              seconds: 3,
            ),
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>isVisted? HomeView():const OnBoardingView(),
                ),
              );
            },
          );
       
  }

  @override
  void initState() {
    delayedNavigate();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppAssets.logo,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            AppString.appName,
            style: GoogleFonts.lato(
              color: AppColor.white,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
