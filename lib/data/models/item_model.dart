import 'package:canteen/domain/entities/item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends ItemEntity {
  const ItemModel({
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

  factory ItemModel.fromJson(Map<String, Object?> json) => _$ItemModelFromJson(json);

  Map<String, Object?> toJson() => _$ItemModelToJson(this);
}