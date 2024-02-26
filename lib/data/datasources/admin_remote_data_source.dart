import 'package:canteen/domain/models/product_model.dart';

abstract class AdminRemoteDataSource {
  getAllItems() {}

  getItemById(int id) {}

  addItem(ProductModel product) {}

  updateItem(ProductModel product) {}
}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  @override
  getAllItems() {
    throw UnimplementedError();
  }

  @override
  getItemById(int id) {
    // TODO: implement getItemById
    throw UnimplementedError();
  }

  @override
  addItem(ProductModel product) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  updateItem(ProductModel product) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
