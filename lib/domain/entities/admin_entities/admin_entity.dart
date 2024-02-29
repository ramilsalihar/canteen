import 'package:canteen/domain/entities/admin_entities/payment_details_entity.dart';
import 'package:canteen/domain/entities/admin_entities/schedule_entity.dart';
import 'package:equatable/equatable.dart';

class AdminEntity extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String phoneNumber;
  final String email;
  final List<PaymentDetailsEntity> paymentDetails;
  final ScheduleEntity schedule;

  const AdminEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.email,
    required this.paymentDetails,
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
      paymentDetails,
      schedule,
    ];
  }
}
