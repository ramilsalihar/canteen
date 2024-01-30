import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';

part 'item_entity.g.dart';

@freezed
class ItemEntity with _$ItemEntity {
  const factory ItemEntity({
    required String id,
    required String nameOfProduct,
    required String category,
    required int quantity,
    required double price,
  }) = _ItemEntity;

  factory ItemEntity.fromJson(Map<String, Object?> json) =>
      _$ItemEntityFromJson(json);
}
