import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/core/widgets/custom_elevated_button.dart';

class ModelBottomSheetItem extends StatelessWidget {
  const ModelBottomSheetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.deepGrey,
      ),
      child: Column(
        children: [
          const Spacer(),
          CustomElevatedButton(
            color: AppColor.primary,
            onPressed: () {},
            text: AppString.taskCompleted,
            fontSize: 16.sp,
            btnWidth: 327.w,
            btnHeight: 48.h,
          ),
          const Spacer(),
          CustomElevatedButton(
            color: AppColor.deepRed,
            onPressed: () {},
            text: AppString.deleteTask,
            fontSize: 16.sp,
            btnWidth: 327.w,
            btnHeight: 48.h,
          ),
          const Spacer(),
          CustomElevatedButton(
            color: AppColor.primary,
            onPressed: () {},
            text: AppString.cancel,
            fontSize: 16.sp,
            btnWidth: 327.w,
            btnHeight: 48.h,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
