
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/core/utiles/app_text_style.dart';

class StartEndTimeWidget extends StatefulWidget {
  const StartEndTimeWidget({super.key});

  @override
  State<StartEndTimeWidget> createState() => _StartEndTimeWidgetState();
}

class _StartEndTimeWidgetState extends State<StartEndTimeWidget> {
  @override
  String currentTime = DateFormat("hh:mm a").format(
    DateTime.now(),
  );
  String currentEndTime = DateFormat("hh:mm a").format(
    DateTime.now().add(
      const Duration(
        minutes: 45,
      ),
    ),
  );
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
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
                      TimeOfDay? pickedStartTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          DateTime.now(),
                        ),
                      );
                      setState(() {
                        if (pickedStartTime != null) {
                          currentTime = pickedStartTime!.format(
                            context,
                          );
                        } else {
                          print(
                            "picked date ==null",
                          );
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.timer,
                      color: AppColor.white,
                    ),
                  ),
                  hintText: currentTime,
                ),
              ),
            ],
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
                      TimeOfDay? pickedEndTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          DateTime.now(),
                        ),
                      );
                      setState(() {
                        if (pickedEndTime != null) {
                          currentEndTime = pickedEndTime!.format(
                            context,
                          );
                        } else {
                          print(
                            "picked date ==null",
                          );
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.timer,
                      color: AppColor.white,
                    ),
                  ),
                  hintText: currentEndTime,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
