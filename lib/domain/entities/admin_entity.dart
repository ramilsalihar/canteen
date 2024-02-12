import 'package:equatable/equatable.dart';

class AdminEntity extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String phoneNumber;
  final String email;
  final Map<String, dynamic> details;
  final Map<String, dynamic> schedule;

  const AdminEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.email,
    required this.details,
    required this.schedule,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      surname,
      phoneNumber,
      email,
      details,
      schedule,
    ];
  }
}
