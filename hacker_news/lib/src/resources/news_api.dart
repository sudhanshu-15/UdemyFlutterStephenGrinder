import 'dart:async';
import 'dart:convert';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

final _root = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get("$_root/topstories.json");
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get("$_root/item/$id.json");
    final item = ItemModel.fromJson(json.decode(response.body));
    return item;
  }
}
