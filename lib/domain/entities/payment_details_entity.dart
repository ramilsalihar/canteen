import 'package:equatable/equatable.dart';

class PaymentDetailsEntity extends Equatable {
  final String name;
  final String cardNumber;

  const PaymentDetailsEntity({
    required this.name,
    required this.cardNumber,
  });

  @override
  List<Object> get props {
    return [
      name,
      cardNumber,
    ];
  }
}
