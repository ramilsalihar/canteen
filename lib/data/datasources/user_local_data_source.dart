import 'dart:convert';

import 'package:canteen/core/error/exception.dart';
import 'package:canteen/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<List<ProductModel>> getItemsFromCache();

  Future<void> itemsToCache(List<ProductModel> items);
}

const cachedItems = 'CACHED_ITEMS';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ProductModel>> getItemsFromCache() {
    final jsonItemsList = sharedPreferences.getStringList(cachedItems);
    if (jsonItemsList != null) {
      return Future.value(jsonItemsList
          .map(
            (jsonItem) => ProductModel.fromJson(jsonDecode(jsonItem)),
          )
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> itemsToCache(List<ProductModel> items) {
    final List<String> jsonItemsList =
        items.map((item) => jsonEncode(item.toJson())).toList();

    sharedPreferences.setStringList(
      cachedItems,
      jsonItemsList,
    );

    // ignore: void_checks
    return Future.value(jsonItemsList);
  }
}
