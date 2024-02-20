class ScheduleModel {
  final List<DayScheduleModel> schedules;

  ScheduleModel({
    required this.schedules,
  });
}

class DayScheduleModel {
  final String day;
  final String startTime;
  final String endTime;

  DayScheduleModel({
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}
