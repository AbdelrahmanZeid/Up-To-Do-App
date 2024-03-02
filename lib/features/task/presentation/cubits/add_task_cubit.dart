import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utiles/app_color.dart';
import 'package:notes_app/features/task/data/add_task_model.dart';
import 'package:notes_app/features/task/presentation/cubits/add_task_states.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  AddTaskCubit()
      : super(
          AddTaskInitial(),
        );

  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();

  int currentIndex = 0;
  String currentTime = DateFormat(
    "hh:mm a",
  ).format(
    DateTime.now(),
  );
  String currentEndTime = DateFormat(
    "hh:mm a",
  ).format(
    DateTime.now().add(
      const Duration(
        minutes: 45,
      ),
    ),
  );

  getStartTime(context) async {
    emit(
      GetStartTimeLoadingState(),
    );
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        DateTime.now(),
      ),
    );

    if (pickedStartTime != null) {
      currentTime = pickedStartTime.format(
        context,
      );
      emit(
        GetStratTimeSuccessState(),
      );
    } else {
      emit(
        GetStratTimeFailuerState(),
      );
    }
  }

  getEndTime(context) async {
    emit(
      GetEndTimeLoadingState(),
    );
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        DateTime.now(),
      ),
    );

    if (pickedEndTime != null) {
      currentEndTime = pickedEndTime.format(
        context,
      );
      emit(
        GetEndTimeSuccessState(),
      );
    } else {
      emit(
        GetEndTimeFailuerState(),
      );
    }
  }

  getDate(context) async {
    emit(
      GetDateLoadingState(),
    );
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: currentDate,
      initialDate: currentDate,
      lastDate: DateTime(
        2025,
      ),
    );

    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(
        GetDateSuccessState(),
      );
    } else {
      emit(
        GetDateFailuerState(),
      );
    }
  }

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

  void changeMarkIndex(index) {
    currentIndex = index;
    emit(
      ChangeIndexSuccssState(),
    );
  }

  List<AddTaskModel> addTaskModelList = [
    // AddTaskModel(
    //   id: 1,
    //   note: "learn dart",
    //   title: "study dart for 24 hour",
    //   color: 3,
    //   startTime: '09:33 PM',
    //   endTime: '09:48 PM',
    //   isCompleted: true,
    //   date: '8/6/2023',
    // ),
    // AddTaskModel(
    //   id: 3,
    //   note: "flutter",
    //   title: "study flutter for 24 hour",
    //   color: 4,
    //   startTime: '09:33 PM',
    //   endTime: '09:48 PM',
    //   isCompleted: false,
    //   date: '10/6/2023',
    // ),
    // AddTaskModel(
    //   id: 2,
    //   note: "learn java",
    //   title: "study java for 24 hour",
    //   color: 2,
    //   startTime: '09:33 PM',
    //   endTime: '09:48 PM',
    //   isCompleted: false,
    //   date: '8/10/2023',
    // ),
  ];

  void insertTask(AddTaskModel task) async {
    try {
      await Future.delayed(
        const Duration(
          seconds: 3,
        ),
      );
      emit(
        InsertTaskLoadingState(),
      );
      addTaskModelList.add(
        task,
      );
      emit(
        InsertTaskSuccessState(),
      );
    } catch (e) {
      emit(
        InsertTaskFailuerState(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
