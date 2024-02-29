import 'package:canteen/domain/entities/product_entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required String id,
    required String nameOfProduct,
    required String category,
    required int quantity,
    required double price,
  }) : super(
          id: id,
          nameOfProduct: nameOfProduct,
          category: category,
          quantity: quantity,
          price: price,
        );

  const ProductModel.empty()
      : super(
          id: '',
          nameOfProduct: '',
          category: '',
          quantity: 0,
          price: 0.0,
        );

  factory ProductModel.fromJson(Map<String, Object?> json) {
    return ProductModel(
      id: json['id'] as String,
      nameOfProduct: json['nameOfProduct'] as String,
      category: json['category'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'nameOfProduct': nameOfProduct,
      'category': category,
      'quantity': quantity,
      'price': price,
    };
  }
}
