import 'package:equatable/equatable.dart';

class DayScheduleEntity extends Equatable {
  final String day;
  final String startTime;
  final String endTime;

  const DayScheduleEntity({
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  @override
  List<Object?> get props => [day, startTime, endTime];
}
