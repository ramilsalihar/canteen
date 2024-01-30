import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_entity.freezed.dart';

part 'admin_entity.g.dart';

@freezed
class AdminEntity with _$AdminEntity {
  const factory AdminEntity({
   required String id,
   required String name,
    required String surname,
    required String phoneNumber,
    required Map<String, Map<String, String>> paymentDetails,
}) = _AdminEntity;

  factory AdminEntity.fromJson(Map<String, Object?> json) => _$AdminEntityFromJson(json);
}