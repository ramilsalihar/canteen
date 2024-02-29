import 'package:canteen/domain/entities/admin_entities/schedule_entity.dart';

class ScheduleModel extends ScheduleEntity {
  const ScheduleModel({
    required DayScheduleModel mon,
    required DayScheduleModel tue,
    required DayScheduleModel wed,
    required DayScheduleModel thu,
    required DayScheduleModel fri,
    required DayScheduleModel sat,
    required DayScheduleModel sun,
  }) : super(
          mon: mon,
          tue: tue,
          wed: wed,
          thu: thu,
          fri: fri,
          sat: sat,
          sun: sun,
        );

  static ScheduleModel empty() => const ScheduleModel(
        mon: DayScheduleModel(startTime: '', endTime: ''),
        tue: DayScheduleModel(startTime: '', endTime: ''),
        wed: DayScheduleModel(startTime: '', endTime: ''),
        thu: DayScheduleModel(startTime: '', endTime: ''),
        fri: DayScheduleModel(startTime: '', endTime: ''),
        sat: DayScheduleModel(startTime: '', endTime: ''),
        sun: DayScheduleModel(startTime: '', endTime: ''),
      );

  factory ScheduleModel.fromJson(Map<String, Object?> json) {
    return ScheduleModel(
      mon: DayScheduleModel.fromJson(json['mon'] as Map<String, Object?>),
      tue: DayScheduleModel.fromJson(json['tue'] as Map<String, Object?>),
      wed: DayScheduleModel.fromJson(json['wed'] as Map<String, Object?>),
      thu: DayScheduleModel.fromJson(json['thu'] as Map<String, Object?>),
      fri: DayScheduleModel.fromJson(json['fri'] as Map<String, Object?>),
      sat: DayScheduleModel.fromJson(json['sat'] as Map<String, Object?>),
      sun: DayScheduleModel.fromJson(json['sun'] as Map<String, Object?>),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'mon': mon,
      'tue': tue,
      'wed': wed,
      'thu': thu,
      'fri': fri,
      'sat': sat,
      'sun': sun,
    };
  }
}

class DayScheduleModel extends DayScheduleEntity {
  const DayScheduleModel({
    required String startTime,
    required String endTime,
  }) : super(
          startTime: startTime,
          endTime: endTime,
        );

  factory DayScheduleModel.fromJson(Map<String, Object?> json) {
    return DayScheduleModel(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}
