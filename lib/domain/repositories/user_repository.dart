import 'package:canteen/core/error/failure.dart';
import 'package:canteen/data/models/product_model.dart';
import 'package:canteen/domain/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<ProductModel>>> getAllItems();

  Future<Either<Failure, UserModel>> getUserInfo();
}
