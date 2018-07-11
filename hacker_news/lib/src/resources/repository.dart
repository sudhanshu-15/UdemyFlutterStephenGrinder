import 'dart:async';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/resources/news_api.dart';
import 'package:hacker_news/src/resources/news_db.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();

  Future<List<int>> fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }
    item = await apiProvider.fetchItem(id);

    dbProvider.addItem(item);
    return item;
  }
}
