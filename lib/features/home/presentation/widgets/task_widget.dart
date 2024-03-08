import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/core/utiles/app_text_style.dart';
import 'package:notes_app/features/home/presentation/widgets/model_bottom_sheet_item.dart';
import 'package:notes_app/features/task/data/add_task_model.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.addTaskModel,
  });
  final AddTaskModel addTaskModel;

  Color getColor(
    index,
  ) {
    switch (index) {
      case 0:
        return AppColor.red;
      case 1:
        return AppColor.green;
      case 2:
        return AppColor.blueGrey;
      case 3:
        return AppColor.blue;
      case 4:
        return AppColor.orange;
      case 5:
        return AppColor.purple;
      default:
        return AppColor.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              return const ModelBottomSheetItem();
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
        height: 135.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          color: getColor(
            addTaskModel.color,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addTaskModel.title,
                    style: AppTextStyle.latoTextStyle(
                      24,
                      FontWeight.w400,
                      AppColor.white,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "${addTaskModel.startTime} - ${addTaskModel.endTime} ",
                        style: AppTextStyle.latoTextStyle(
                          16,
                          FontWeight.w400,
                          AppColor.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    addTaskModel.note,
                    style: AppTextStyle.latoTextStyle(
                      24,
                      FontWeight.w400,
                      AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 1.w,
              height: 80.h,
              color: AppColor.white,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                addTaskModel.isCompleted ==1 ? AppString.completed : AppString.toDo,
                style: AppTextStyle.latoTextStyle(
                  17,
                  FontWeight.w600,
                  AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
