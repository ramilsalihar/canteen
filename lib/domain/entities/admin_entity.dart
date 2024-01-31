import 'package:equatable/equatable.dart';

class AdminEntity extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String phoneNumber;
  final Map<String, Map<String, String>> paymentDetails;

  const AdminEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.paymentDetails,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      surname,
      phoneNumber,
      paymentDetails,
    ];
  }
}
