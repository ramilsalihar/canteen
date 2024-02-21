import 'package:canteen/domain/models/product_bill_model.dart';

class UserModel {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String userType;
  final String phoneNumber;
  final double balance;
  final List<ProductBillModel> purchases;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.userType,
    required this.phoneNumber,
    required this.balance,
    required this.purchases,
  });
}

class Users {
  final List<UserModel> users;

  Users({required this.users});
}
