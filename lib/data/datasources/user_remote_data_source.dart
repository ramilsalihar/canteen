import 'package:canteen/data/models/product_model.dart';

abstract class UserRemoteDataSource {
  Future<List<ProductModel>> getAllItems();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<List<ProductModel>> getAllItems() {
    //TODO: implement getAllItems
    return Future.value([]);
  }
}
