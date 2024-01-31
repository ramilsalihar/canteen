import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String id;
  final String nameOfProduct;
  final String category;
  final int quantity;
  final double price;

  const ItemEntity({
    required this.id,
    required this.nameOfProduct,
    required this.category,
    required this.quantity,
    required this.price,
  });

  @override
  List<Object> get props {
    return [
      id,
      nameOfProduct,
      category,
      quantity,
      price,
    ];
  }
}
