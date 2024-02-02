import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String classYear;
  final String phoneNumber;
  final double balance;

  const UserEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.classYear,
    required this.phoneNumber,
    required this.balance,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      surname,
      email,
      classYear,
      phoneNumber,
      balance,
    ];
  }
}
