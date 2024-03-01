import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/core/utiles/app_text_style.dart';
import 'package:notes_app/features/task/presentation/cubits/add_task_cubit.dart';
import 'package:notes_app/features/task/presentation/cubits/add_task_states.dart';

class StartEndTimeWidget extends StatelessWidget {
  const StartEndTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<AddTaskCubit, AddTaskStates>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.startTime,
                    style: AppTextStyle.latoTextStyle(
                      16,
                      FontWeight.w400,
                      AppColor.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await context.read<AddTaskCubit>().getStartTime(
                                context,
                              );
                        },
                        icon: const Icon(
                          Icons.timer,
                          color: AppColor.white,
                        ),
                      ),
                      hintText: context.read<AddTaskCubit>().currentTime,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.endTime,
                style: AppTextStyle.latoTextStyle(
                  16,
                  FontWeight.w400,
                  AppColor.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async {
                      await context.read<AddTaskCubit>().getEndTime(
                                context,
                              );
                    },
                    icon: const Icon(
                      Icons.timer,
                      color: AppColor.white,
                    ),
                  ),
                  hintText: context.read<AddTaskCubit>().currentEndTime,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
