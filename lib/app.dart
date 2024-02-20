import 'package:flutter/material.dart';
import 'package:notes_app/core/utiles/app_theme.dart';
import 'package:notes_app/features/auth/presentation/views/splash_view.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getAppTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
