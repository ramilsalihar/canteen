import 'package:canteen/core/error/failure.dart';
import 'package:canteen/core/usecases/usecase.dart';
import 'package:canteen/data/models/product_model.dart';
import 'package:canteen/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class ViewContentUseCase extends UseCase<List<ProductModel>, Params> {
  final UserRepository userRepository;

  ViewContentUseCase(this.userRepository);

  @override
  Future<Either<Failure, List<ProductModel>>> call() async {
    return await userRepository.getAllItems();
  }
}

class Params {}
