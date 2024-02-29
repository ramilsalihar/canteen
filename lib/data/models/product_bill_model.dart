import 'package:canteen/data/models/product_model.dart';
import 'package:canteen/domain/entities/product_entities/product_bill_entity.dart';

class ProductBillModel extends ProductBillEntity {
  const ProductBillModel({
    required String id,
    required String date,
    required List<ProductModel> products,
  }) : super(
          id: id,
          date: date,
          products: products,
        );

  factory ProductBillModel.fromJson(Map<String, dynamic> json) {
    return ProductBillModel(
      id: json['id'] as String,
      date: json['date'] as String,
      products: (json['products'] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'products': products.map((e) => e).toList(),
    };
  }
}
