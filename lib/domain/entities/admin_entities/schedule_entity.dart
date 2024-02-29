import 'package:equatable/equatable.dart';

class ScheduleEntity extends Equatable {
  final DayScheduleEntity mon;
  final DayScheduleEntity tue;
  final DayScheduleEntity wed;
  final DayScheduleEntity thu;
  final DayScheduleEntity fri;
  final DayScheduleEntity sat;
  final DayScheduleEntity sun;

  const ScheduleEntity({
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
    required this.sun,
  });

  @override
  List<Object?> get props => [
        mon,
        tue,
        wed,
        thu,
        fri,
        sat,
        sun,
      ];
}

class DayScheduleEntity extends Equatable {
  final String startTime;
  final String endTime;

  const DayScheduleEntity({
    required this.startTime,
    required this.endTime,
  });

  @override
  List<Object?> get props => [startTime, endTime];
}
