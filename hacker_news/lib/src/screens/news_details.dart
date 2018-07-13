import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/comments_bloc.dart';
import 'package:hacker_news/src/blocs/comments_provider.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/widgets/comment.dart';

class NewsDetails extends StatelessWidget {
  final itemId;
  NewsDetails({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = CommentsProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: buildBody(bloc),
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading..');
        }
        final itemFuture = snapshot.data[itemId];

        return FutureBuilder(
          future: itemFuture,
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text("Loading Future..");
            }
            return buildList(itemSnapshot.data, snapshot.data);
          },
        );
      },
    );
  }

  Widget buildList(ItemModel item, Map<int, Future<ItemModel>> itemMap) {
    final children = <Widget>[];
    children.add(buildStory(item));
    final commentsList = item.kids.map((commentId) {
      return Comment(
        itemId: commentId,
        itemMap: itemMap,
      );
    }).toList();
    children.addAll(commentsList);

    return ListView(children: children);
  }

  Widget buildStory(ItemModel item) {
    print(item.id);
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            item.title ?? 'No story',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SafeArea(
            child: Container(
              height: 8.0,
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Read More',
                  style: TextStyle(color: Colors.white),
                ),
                SafeArea(
                  child: Container(
                    width: 4.0,
                  ),
                ),
                Icon(
                  Icons.launch,
                  color: Colors.white,
                )
              ],
            ),
            onPressed: () {
              print('Launch ${item.url}');
            },
          )
        ],
      ),
    );
  }
}
