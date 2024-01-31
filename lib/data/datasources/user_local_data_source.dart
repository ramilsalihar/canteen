import 'dart:convert';

import 'package:canteen/core/error/exception.dart';
import 'package:canteen/data/models/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<List<ItemModel>> getItemsFromCache();

  Future<void> itemsToCache(List<ItemModel> items);
}

const cachedItems = 'CACHED_ITEMS';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ItemModel>> getItemsFromCache() {
    final jsonItemsList = sharedPreferences.getStringList(cachedItems);
    if (jsonItemsList != null) {
      return Future.value(jsonItemsList
          .map(
            (jsonItem) => ItemModel.fromJson(jsonDecode(jsonItem)),
          )
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> itemsToCache(List<ItemModel> items) {
    final List<String> jsonItemsList =
        items.map((item) => jsonEncode(item.toJson())).toList();

    sharedPreferences.setStringList(
      cachedItems,
      jsonItemsList,
    );

    return Future.value(jsonItemsList);
  }
}
