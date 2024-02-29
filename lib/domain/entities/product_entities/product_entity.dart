import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  final List<ProductEntity> products;

  const ProductsEntity({
    required this.products,
  });

  @override
  List<Object> get props {
    return [
      products,
    ];
  }
}

class ProductEntity extends Equatable {
  final String id;
  final String nameOfProduct;
  final String category;
  final int quantity;
  final double price;

  const ProductEntity({
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
