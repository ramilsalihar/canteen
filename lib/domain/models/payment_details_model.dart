class PaymentDetailsModel {
  final List<CardDetailModel> cards;

  PaymentDetailsModel({
    required this.cards,
  });
}

class CardDetailModel {
  final String name;
  final String cardNumber;

  CardDetailModel({
    required this.name,
    required this.cardNumber,
  });
}
