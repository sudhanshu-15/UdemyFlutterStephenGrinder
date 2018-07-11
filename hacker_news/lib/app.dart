import 'package:flutter/material.dart';
import 'package:hacker_news/src/screens/news_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackerNews',
      home: NewsList(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
