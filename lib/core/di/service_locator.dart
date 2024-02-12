import 'package:canteen/core/platform/network_info.dart';
import 'package:canteen/data/datasources/user_remote_data_source.dart';
import 'package:canteen/data/repositories/user_repository_impl.dart';
import 'package:canteen/domain/repositories/user_repository.dart';
import 'package:canteen/domain/usecases/user_cases/get_all_items.dart';
import 'package:canteen/presentation/bloc/get_items/get_items_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

init() {
  // Bloc & Cubit
  sl.registerFactory(() => GetItemsBloc(getAllItems: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetAllItems(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        userRemoteDataSource: sl(),
        userLocalDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => InternetConnectionChecker());

  // Firebase
  var ref = sl.registerSingleton<FirebaseDatabase>(FirebaseDatabase.instance);
}
