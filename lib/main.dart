import 'package:flutter/material.dart';
import 'package:notes_app/app.dart';
import 'package:notes_app/core/database/cache_helper.dart';
import 'package:notes_app/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CacheHelper>().init();
  runApp(
    const Notes(),
  );
}
