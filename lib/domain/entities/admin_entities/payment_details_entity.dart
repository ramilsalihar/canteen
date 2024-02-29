import 'package:equatable/equatable.dart';

class PaymentDetailsEntity extends Equatable {
  final String cardName;
  final String cardNumber;

  const PaymentDetailsEntity({
    required this.cardName,
    required this.cardNumber,
  });

  @override
  List<Object> get props {
    return [
      cardName,
      cardNumber,
    ];
  }
}
