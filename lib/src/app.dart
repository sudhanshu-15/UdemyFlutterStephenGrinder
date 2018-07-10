import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import 'package:login_bloc/src/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: MaterialApp(
        title: 'Log Me',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Log Me'),
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
