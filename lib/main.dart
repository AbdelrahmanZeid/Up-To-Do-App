import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app.dart';
import 'package:notes_app/core/database/cache_helper.dart';
import 'package:notes_app/core/services/service_locator.dart';
import 'package:notes_app/features/task/presentation/cubits/add_task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CacheHelper>().init();
  runApp(
  BlocProvider(
      create: (context) => AddTaskCubit(),
      child:const Notes(),
    ),
  );
}
