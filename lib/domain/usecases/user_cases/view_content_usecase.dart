import 'package:canteen/core/error/failure.dart';
import 'package:canteen/core/usecases/usecase.dart';
import 'package:canteen/domain/entities/item_entity.dart';
import 'package:canteen/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class ViewContentUseCase extends UseCase<List<ItemEntity>, Params> {
  final UserRepository userRepository;

  ViewContentUseCase(this.userRepository);

  @override
  Future<Either<Failure, List<ItemEntity>>> call() async {
    return await userRepository.getAllItems();
  }
}

class Params {}
