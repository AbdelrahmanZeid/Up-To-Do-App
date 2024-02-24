import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utiles/app_assets.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 12,
              // ),
              Text(
                DateFormat.yMMMMd().format(
                  DateTime.now(),
                ),
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                AppString.today,
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 100,
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColor.primary,
                  selectedTextColor: Colors.white,
                  dateTextStyle: const TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                  ),
                  dayTextStyle: const TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                  ),
                  monthTextStyle: const TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                  ),
                  onDateChange: (date) {
                    // New date selected
                    // setState(() {
                    //   _selectedValue = date;
                    // });
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              //  const NoTaskWidget(),
              TaskWidget(),
              //  TaskWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.noTask,
        ),
        Text(
          AppString.noTask,
          style: GoogleFonts.lato(fontSize: 24, color: AppColor.white),
        ),
        Text(
          AppString.noTask2,
          style: GoogleFonts.lato(
            fontSize: 16,
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              return Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.deepGrey,
                ),
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 24,
        ),
        padding: const EdgeInsets.all(
          8,
        ),
        width: double.infinity,
        height: 135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          color: AppColor.red,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task 1",
                    style: GoogleFonts.lato(
                      color: AppColor.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        color: AppColor.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "09:33 PM - 09:48 PM",
                        style: GoogleFonts.lato(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Learn Dart",
                    style: GoogleFonts.lato(
                      color: AppColor.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 80,
              color: AppColor.white,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                AppString.toDo,
                style: GoogleFonts.lato(
                  color: AppColor.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
