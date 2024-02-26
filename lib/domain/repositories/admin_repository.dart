import 'package:canteen/core/error/failure.dart';
import 'package:canteen/data/models/admin_model.dart';
import 'package:canteen/domain/models/product_model.dart';
import 'package:canteen/domain/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdminRepository {
  Future<Either<Failure, AdminModel>> getUserInfo();

  Future<Either<Failure, List<UserModel>>> getAllUsers();

  Future<Either<Failure, List<ProductModel>>> getAllItems();
}
