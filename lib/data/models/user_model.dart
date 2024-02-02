import 'package:canteen/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String name,
    required String surname,
    required String email,
    required String classYear,
    required String phoneNumber,
    required double balance,
  }) : super(
          id: id,
          name: name,
          surname: surname,
          email: email,
          classYear: classYear,
          phoneNumber: phoneNumber,
          balance: balance,
        );

  const UserModel.empty()
      : super(
          id: '',
          name: '',
          surname: '',
          email: '',
          classYear: '',
          phoneNumber: '',
          balance: 0.0,
        );

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  Map<String, Object?> toJson() => _$UserModelToJson(this);
}
