import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hacker_news/src/models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;

  Comment({this.itemId, this.itemMap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) {
          return Text('Still loading comment..');
        }

        final children = <Widget>[
          buildCommentTile(snapshot.data),
        ];

        snapshot.data.kids.forEach(
          (kidId) => children.add(
                Comment(
                  itemId: kidId,
                  itemMap: itemMap,
                ),
              ),
        );

        return Column(
          children: children,
        );
      },
    );
  }

  Widget buildCommentTile(ItemModel item) {
    return Card(
      color: Colors.white30,
      child: ListTile(
        title: Text(item.text),
        subtitle: Text(item.by),
      ),
    );
  }
}
