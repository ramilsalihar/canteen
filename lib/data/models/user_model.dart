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
    required String userType,
    required String phoneNumber,
    required double balance,
    required List<dynamic> purchases,
  }) : super(
          id: id,
          name: name,
          surname: surname,
          email: email,
          userType: userType,
          phoneNumber: phoneNumber,
          balance: balance,
          purchases: purchases,
        );

  UserModel.empty()
      : super(
          id: '',
          name: '',
          surname: '',
          email: '',
          userType: '',
          phoneNumber: '',
          balance: 0.0,
          purchases: [],
        );

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  Map<String, Object?> toJson() => _$UserModelToJson(this);
}
