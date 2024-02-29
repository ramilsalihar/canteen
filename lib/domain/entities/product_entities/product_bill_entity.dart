import 'package:canteen/domain/entities/product_entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class ProductBillEntity extends Equatable {
  final String id;
  final String date;
  final List<ProductEntity> products;

  const ProductBillEntity({
    required this.id,
    required this.date,
    required this.products,
  });

  @override
  List<Object> get props {
    return [
      id,
      date,
      products,
    ];
  }
}
