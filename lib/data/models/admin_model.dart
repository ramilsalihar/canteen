import 'package:canteen/data/models/schedule_model.dart';
import 'package:canteen/domain/entities/admin_entities/admin_entity.dart';
import 'package:canteen/domain/entities/admin_entities/payment_details_entity.dart';

class AdminModel extends AdminEntity {
  const AdminModel({
    required String id,
    required String name,
    required String surname,
    required String email,
    required String phoneNumber,
    required List<PaymentDetailsModel> paymentDetails,
    required ScheduleModel schedule,
  }) : super(
          id: id,
          name: name,
          surname: surname,
          email: email,
          phoneNumber: phoneNumber,
          paymentDetails: paymentDetails,
          schedule: schedule,
        );

  AdminModel.empty()
      : super(
          id: '',
          name: '',
          surname: '',
          email: '',
          phoneNumber: '',
          paymentDetails: [],
          schedule: ScheduleModel.empty(),
        );

  factory AdminModel.fromJson(Map<String, Object?> json) {
    return AdminModel(
      id: json['id'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      paymentDetails: (json['paymentDetails'] as List)
          .map((e) => PaymentDetailsModel.fromJson(e as Map<String, Object?>))
          .toList(),
      schedule:
          ScheduleModel.fromJson(json['schedule'] as Map<String, Object?>),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'phoneNumber': phoneNumber,
      'paymentDetails': paymentDetails.map((e) => e).toList(),
      'schedule': schedule,
    };
  }
}

class PaymentDetailsModel extends PaymentDetailsEntity {
  const PaymentDetailsModel({
    required String cardName,
    required String cardNumber,
  }) : super(
          cardName: cardName,
          cardNumber: cardNumber,
        );

  factory PaymentDetailsModel.fromJson(Map<String, Object?> json) {
    return PaymentDetailsModel(
      cardName: json['cardName'] as String,
      cardNumber: json['cardNumber'] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'cardName': cardName,
      'cardNumber': cardNumber,
    };
  }
}
