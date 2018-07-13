import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/widgets/loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comment({this.itemId, this.itemMap, this.depth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final children = <Widget>[
          buildCommentTile(snapshot.data, depth),
        ];

        snapshot.data.kids.forEach(
          (kidId) => children.add(
                Comment(
                  itemId: kidId,
                  itemMap: itemMap,
                  depth: this.depth + 1,
                ),
              ),
        );

        return Column(
          children: children,
        );
      },
    );
  }

  Widget buildCommentTile(ItemModel item, int depth) {
    return Padding(
      padding:
          EdgeInsets.only(right: 8.0, left: depth == 0 ? 8.0 : 16.0 * depth),
      child: Card(
        color: Colors.white30,
        child: ListTile(
          title: buildText(item),
          subtitle: item.by == "" ? Text('Deleted') : Text(item.by),
        ),
      ),
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text
        .replaceAll('&#x27;', "'")
        .replaceAll('<p>', "\n\n")
        .replaceAll("</p>", "")
        .replaceAll("&#x2F;", "/")
        .replaceAll("&amp;", "&")
        .replaceAll("&gt;", "<")
        .replaceAll("&quot;", '"');

    return Text(text);
  }
}
