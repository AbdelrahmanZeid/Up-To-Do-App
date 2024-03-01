import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/features/home/presentation/widgets/no_task_widget.dart';
import 'package:notes_app/features/home/presentation/widgets/task_widget.dart';
import 'package:notes_app/features/task/presentation/cubits/add_task_cubit.dart';
import 'package:notes_app/features/task/presentation/cubits/add_task_states.dart';
import 'package:notes_app/features/task/presentation/views/add_task_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return const AddTaskView();
              },
            ),
          );
        },
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            360,
          ),
        ),
        child: const Icon(
          Icons.add,
          color: AppColor.white,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            24,
          ),
          child: BlocBuilder<AddTaskCubit, AddTaskStates>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(
                      DateTime.now(),
                    ),
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 32.sp,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    AppString.today,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 28.sp,
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: AppColor.primary,
                      selectedTextColor: Colors.white,
                      dateTextStyle: TextStyle(
                        color: AppColor.white,
                        fontSize: 16.sp,
                      ),
                      dayTextStyle: TextStyle(
                        color: AppColor.white,
                        fontSize: 16.sp,
                      ),
                      monthTextStyle: TextStyle(
                        color: AppColor.white,
                        fontSize: 16.sp,
                      ),
                      onDateChange: (date) {
                        // New date selected
                        // setState(() {
                        //   _selectedValue = date;
                        // });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  context.read<AddTaskCubit>().addTaskModelList.isEmpty
                      ? const NoTaskWidget()
                      : Expanded(
                          child: ListView.builder(
                            itemCount: context
                                .read<AddTaskCubit>()
                                .addTaskModelList
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return TaskWidget(
                                addTaskModel: context
                                    .read<AddTaskCubit>()
                                    .addTaskModelList[index],
                              );
                            },
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
