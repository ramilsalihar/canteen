import 'package:canteen/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class ProductBillEntity extends Equatable {
  final String id;
  final String date;
  final List<ProductEntity> products;
  final String total;

  const ProductBillEntity({
    required this.id,
    required this.date,
    required this.products,
    required this.total,
  });

  @override
  List<Object> get props {
    return [
      id,
      date,
      products,
      total,
    ];
  }
}
