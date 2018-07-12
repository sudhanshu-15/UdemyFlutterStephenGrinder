import 'dart:convert';

import 'package:hacker_news/src/resources/news_api.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  test("fetchTopIds returns list of ids", () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient(
      (request) async {
        var fakeIds = json.encode([1, 2, 3, 4]);
        return Response(fakeIds, 200);
      },
    );
    final ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4]);
  });

  test('fetchItem returns item model', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final itemMap = {'id': 123};
      return Response(json.encode(itemMap), 200);
    });

    final item = await newsApi.fetchItem(999);
    expect(item.id, 123);
  });
}
