import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/features/auth/data/models/on_boarding_model.dart';
import 'package:notes_app/features/auth/presentation/widgets/back_next_buttons.dart';
import 'package:notes_app/features/auth/presentation/widgets/page_view_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 730.h,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return PageViewItem(
                    onBoardingModel: onBoardingItemList[index],
                    controller: controller,
                  );
                },
                itemCount: onBoardingItemList.length,
              ),
            ),
            BackNextButtons(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
