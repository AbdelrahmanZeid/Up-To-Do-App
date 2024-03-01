class AddTaskModel {
  final int id;
  final String note;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final int color;
  bool isCompleted;

  AddTaskModel({
    required this.startTime,
    required this.date,
    required this.isCompleted,
    required this.endTime,
    required this.id,
    required this.note,
    required this.title,
    required this.color,
  });
}
