import 'package:canteen/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
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

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);

  Map<String, Object?> toJson() => _$ProductModelToJson(this);
}
