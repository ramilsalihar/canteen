abstract class AdminLocalDataSource {
  Future<void> itemsToCache(List items);

  getItemsFromCache() {}

  void itemToCache(remoteItem) {}

  getItemFromCache(int id) {}
}

class AdminLocalDataSourceImpl implements AdminLocalDataSource {
  @override
  Future<void> itemsToCache(List items) async {}

  @override
  getItemsFromCache() {
    // TODO: implement getItemsFromCache
    throw UnimplementedError();
  }

  @override
  void itemToCache(remoteItem) {
    // TODO: implement itemToCache
  }

  @override
  getItemFromCache(int id) {
    // TODO: implement getItemFromCache
    throw UnimplementedError();
  }
}
