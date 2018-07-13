import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/comments_bloc.dart';
class CommentsProvider extends InheritedWidget {
  final CommentsBloc bloc;

  CommentsProvider({Key key, Widget child})
      : bloc = CommentsBloc(),
        super(key: key, child: child);

  static CommentsBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CommentsProvider)
              as CommentsProvider)
          .bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}