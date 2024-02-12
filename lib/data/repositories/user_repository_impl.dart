import 'package:canteen/core/error/failure.dart';
import 'package:canteen/core/platform/network_info.dart';
import 'package:canteen/data/datasources/user_local_data_source.dart';
import 'package:canteen/data/datasources/user_remote_data_source.dart';
import 'package:canteen/data/models/item_model.dart';
import 'package:canteen/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ItemModel>>> getAllItems() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await userRemoteDataSource.getAllItems();
        userLocalDataSource.itemsToCache(remoteUser);
        return Right(remoteUser);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localItems = await userLocalDataSource.getItemsFromCache();
        return Right(localItems);
      } on Exception {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, String>> getUserRole() {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    User user = FirebaseAuth.instance.currentUser!;

    return Future.value(Right('admin'));
  }
}
