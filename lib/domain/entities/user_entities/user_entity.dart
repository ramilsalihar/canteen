import 'package:canteen/domain/entities/product_entities/product_bill_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String userType;
  final String phoneNumber;
  final double balance;
  final List<ProductBillEntity> purchases;

  const UserEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.userType,
    required this.phoneNumber,
    required this.balance,
    required this.purchases,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      surname,
      email,
      userType,
      phoneNumber,
      balance,
      purchases,
    ];
  }
}
