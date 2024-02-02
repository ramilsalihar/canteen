import 'package:canteen/data/models/item_model.dart';

abstract class UserRemoteDataSource {
  Future<List<ItemModel>> getAllItems();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<List<ItemModel>> getAllItems() {
    //TODO: implement getAllItems
    return Future.value([]);
  }
}
