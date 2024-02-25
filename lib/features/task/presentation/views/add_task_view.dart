import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/core/utiles/app_strings.dart';
import 'package:notes_app/core/utiles/app_text_style.dart';
import 'package:notes_app/core/widgets/custom_elevated_button.dart';
import 'package:notes_app/features/task/presentation/widgets/start_end_time_widget.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.addTask,
          style: AppTextStyle.latoTextStyle(
            32,
            FontWeight.w700,
            AppColor.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.white,
          ),
        ),
      ),
      body: const AddTaskViewBody(),
    );
  }
}

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  DateTime currentDate = DateTime.now();

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 22,
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
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: AppString.titleHint,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              AppString.note,
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
              controller: noteController,
              decoration: const InputDecoration(
                hintText: AppString.noteHint,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              AppString.date,
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
              controller: dateController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: currentDate,
                      initialDate: currentDate,
                      lastDate: DateTime(
                        2025,
                      ),
                    );
                    setState(() {
                      currentDate = pickedDate!;
                    });
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: AppColor.white,
                  ),
                ),
                hintText: DateFormat.yMd().format(
                  currentDate,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const StartEndTimeWidget(),
            const SizedBox(
              height: 5,
            ),
            Expanded(
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
                      // padding: EdgeInsets.symmetric(horizontal: 5,),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (
                        _,
                        index,
                      ) {
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
        
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: GestureDetector(
                            onTap: (){
                               setState(() {
                                 currentIndex=index;
                               });
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: getColor(
                                index,
                              ),
                              child:currentIndex==index? const Icon(
                                Icons.check,
                                size: 30,
                                color: AppColor.white,
                              ):null,
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
            const Spacer(),
            CustomElevatedButton(
              color: AppColor.primary,
              onPressed: () {},
              text: AppString.createTask,
              fontSize: 16,
              btnWidth: double.infinity,
              btnHeight: 60,
            ),
          ],
        ),
      ),
    );
  }
}
