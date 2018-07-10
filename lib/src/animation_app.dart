import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/home.dart';

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Home(),
    );
  }
}
