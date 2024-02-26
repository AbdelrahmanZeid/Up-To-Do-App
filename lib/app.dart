import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/utiles/app_theme.dart';
import 'package:notes_app/features/auth/presentation/views/splash_view.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ),
      builder: (
        _,
        child,
      ) {
        return MaterialApp(
          theme: AppTheme.getAppTheme(),
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        );
      },
    );
  }
}
