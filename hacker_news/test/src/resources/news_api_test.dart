import 'package:hacker_news/src/resources/news_api.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  test("fetchTopIds returns list of ids", () {
    final newsApi = NewsApiProvider();
    MockClient((request) {});
  });
}
