import 'package:dartz/dartz.dart';
import 'package:canteen/core/error/failure.dart';
import 'package:canteen/domain/entities/item_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<ItemEntity>>> getAllItems();
}