import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/core/utiles/app_text_style.dart';
import 'package:notes_app/core/widgets/custom_elevated_button.dart';
import 'package:notes_app/features/task/data/add_task_model.dart';
import 'package:notes_app/features/task/presentation/cubits/add_task_cubit.dart';
import 'package:notes_app/features/task/presentation/cubits/add_task_states.dart';
import 'package:notes_app/features/task/presentation/widgets/start_end_time_widget.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskStates>(
      builder: (context, state) {
        return Form(
          key: context.read<AddTaskCubit>().formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: 22.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.title,
                    style: AppTextStyle.latoTextStyle(
                      16,
                      FontWeight.w400,
                      AppColor.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter value";
                      } else {
                        return null;
                      }
                    },
                    style: AppTextStyle.latoTextStyle(
                        14, FontWeight.w400, AppColor.white),
                    controller: context.read<AddTaskCubit>().titleController,
                    decoration: const InputDecoration(
                      hintText: AppString.titleHint,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    AppString.note,
                    style: AppTextStyle.latoTextStyle(
                      16,
                      FontWeight.w400,
                      AppColor.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter value";
                      } else {
                        return null;
                      }
                    },
                    style: AppTextStyle.latoTextStyle(
                      14,
                      FontWeight.w400,
                      AppColor.white,
                    ),
                    controller: context.read<AddTaskCubit>().noteController,
                    decoration: const InputDecoration(
                      hintText: AppString.noteHint,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    AppString.date,
                    style: AppTextStyle.latoTextStyle(
                      16,
                      FontWeight.w400,
                      AppColor.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await context.read<AddTaskCubit>().getDate(
                                context,
                              );
                        },
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: AppColor.white,
                        ),
                      ),
                      hintText: DateFormat.yMd().format(
                        context.read<AddTaskCubit>().currentDate,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const StartEndTimeWidget(),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 68.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.color,
                          style: AppTextStyle.latoTextStyle(
                            16,
                            FontWeight.w400,
                            AppColor.white,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (
                              _,
                              index,
                            ) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<AddTaskCubit>()
                                        .changeMarkIndex(
                                          index,
                                        );
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor:
                                        context.read<AddTaskCubit>().getColor(
                                              index,
                                            ),
                                    child: context
                                                .read<AddTaskCubit>()
                                                .currentIndex ==
                                            index
                                        ? const Icon(
                                            Icons.check,
                                            size: 30,
                                            color: AppColor.white,
                                          )
                                        : null,
                                  ),
                                ),
                              );
                            },
                            itemCount: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  state is InsertTaskLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ),
                        )
                      : CustomElevatedButton(
                          color: AppColor.primary,
                          onPressed: () {
                            if (context
                                .read<AddTaskCubit>()
                                .formKey
                                .currentState!
                                .validate()) {
                              context.read<AddTaskCubit>().insertTask(
                                    AddTaskModel(
                                      startTime: context
                                          .read<AddTaskCubit>()
                                          .currentTime,
                                      date: context
                                          .read<AddTaskCubit>()
                                          .currentDate
                                          .toString(),
                                      isCompleted: false,
                                      endTime: context
                                          .read<AddTaskCubit>()
                                          .currentEndTime,
                                      id: 1,
                                      note: context
                                          .read<AddTaskCubit>()
                                          .noteController
                                          .text,
                                      title: context
                                          .read<AddTaskCubit>()
                                          .titleController
                                          .text,
                                      color: context
                                          .read<AddTaskCubit>()
                                          .currentIndex,
                                    ),
                                  );
                            }
                            context.read<AddTaskCubit>().noteController.clear();
                            context
                                .read<AddTaskCubit>()
                                .titleController
                                .clear();
                          },
                          text: AppString.createTask,
                          fontSize: 16,
                          btnWidth: double.infinity,
                          btnHeight: 60,
                        ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, AddTaskStates state) {
        if (state is InsertTaskSuccessState) {
          Navigator.pop(
            context,
          );
        } else {}
      },
    );
  }
}
