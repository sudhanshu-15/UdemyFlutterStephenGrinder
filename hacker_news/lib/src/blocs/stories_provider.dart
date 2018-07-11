import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/stories_bloc.dart';

export 'package:hacker_news/src/blocs/stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc storiesBloc;

  StoriesProvider({Key key, Widget child})
      : storiesBloc = StoriesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static StoriesBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(StoriesProvider) as StoriesProvider)
          .storiesBloc;
}
