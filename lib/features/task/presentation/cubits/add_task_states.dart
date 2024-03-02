abstract class AddTaskStates{}
 class AddTaskInitial extends AddTaskStates{}
 class GetDateLoadingState extends AddTaskStates{}
 class GetDateSuccessState extends AddTaskStates{}
 class GetDateFailuerState extends AddTaskStates{}
 class GetStartTimeLoadingState extends AddTaskStates{}
 class GetStratTimeSuccessState extends AddTaskStates{}
 class GetStratTimeFailuerState extends AddTaskStates{}
 class GetEndTimeLoadingState extends AddTaskStates{}
 class GetEndTimeSuccessState extends AddTaskStates{}
 class GetEndTimeFailuerState extends AddTaskStates{}
 class ChangeIndexSuccssState extends AddTaskStates{}
 class InsertTaskLoadingState extends AddTaskStates{}
 class InsertTaskSuccessState extends AddTaskStates{}
 class InsertTaskFailuerState extends AddTaskStates{

  final String errMessage;

  InsertTaskFailuerState({required this.errMessage});
 }