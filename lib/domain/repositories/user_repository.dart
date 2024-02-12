import 'package:canteen/core/error/failure.dart';
import 'package:canteen/domain/entities/item_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<ItemEntity>>> getAllItems();

  Future<Either<Failure, String>> getUserRole();
}
