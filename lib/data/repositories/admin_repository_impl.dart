import 'package:canteen/core/error/failure.dart';
import 'package:canteen/core/platform/network_info.dart';
import 'package:canteen/data/datasources/admin_local_data_source.dart';
import 'package:canteen/data/datasources/admin_remote_data_source.dart';
import 'package:canteen/data/models/admin_model.dart';
import 'package:canteen/domain/models/product_model.dart';
import 'package:canteen/domain/models/user_model.dart';
import 'package:canteen/domain/repositories/admin_repository.dart';
import 'package:dartz/dartz.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDataSource adminRemoteDataSource;
  final AdminLocalDataSource adminLocalDataSource;
  final NetworkInfo networkInfo;

  AdminRepositoryImpl({
    required this.adminRemoteDataSource,
    required this.adminLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getAllItems() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItems = await adminRemoteDataSource.getAllItems();
        adminLocalDataSource.itemsToCache(remoteItems);
        return Right(remoteItems);
      } on Exception {
        return Left(
          ServerFailure(),
        );
      }
    } else {
      try {
        final localItems = await adminLocalDataSource.getItemsFromCache();
        return Right(localItems);
      } on Exception {
        return Left(
          CacheFailure(),
        );
      }
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getItemById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItem = await adminRemoteDataSource.getItemById(id);
        adminLocalDataSource.itemToCache(remoteItem);
        return Right(remoteItem);
      } on Exception {
        return Left(
          ServerFailure(),
        );
      }
    } else {
      try {
        final localItem = await adminLocalDataSource.getItemFromCache(id);
        return Right(localItem);
      } on Exception {
        return Left(
          CacheFailure(),
        );
      }
    }
  }

  @override
  Future<Either<Failure, ProductModel>> addItem(ProductModel product) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItem = await adminRemoteDataSource.addItem(product);
        adminLocalDataSource.itemToCache(remoteItem);
        return Right(remoteItem);
      } on Exception {
        return Left(
          ServerFailure(),
        );
      }
    } else {
      return Left(
        CacheFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateItem(ProductModel product) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItem = await adminRemoteDataSource.updateItem(product);
        adminLocalDataSource.itemToCache(remoteItem);
        return Right(remoteItem);
      } on Exception {
        return Left(
          ServerFailure(),
        );
      }
    } else {
      return Left(
        CacheFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AdminModel>> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }
}
