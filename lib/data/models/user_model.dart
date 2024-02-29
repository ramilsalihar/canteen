import 'package:canteen/data/models/product_bill_model.dart';
import 'package:canteen/domain/entities/user_entities/user_entity.dart';

// part 'user_model.g.dart';

// @JsonSerializable(explicitToJson: true)
class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String name,
    required String surname,
    required String email,
    required String userType,
    required String phoneNumber,
    required double balance,
    required List<ProductBillModel> purchases,
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

  factory UserModel.fromJson(Map<String, Object?> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      userType: json['userType'] as String,
      phoneNumber: json['phoneNumber'] as String,
      balance: (json['balance'] as num).toDouble(),
      purchases: (json['purchases'] as List)
          .map((e) => ProductBillModel.fromJson(e as Map<String, Object?>))
          .toList(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'userType': userType,
      'phoneNumber': phoneNumber,
      'balance': balance,
      'purchases': purchases.map((e) => e).toList(),
    };
  }
}
