import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';

class LoginProvider extends InheritedWidget {
  final LoginBloc loginBloc = LoginBloc();

  LoginProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(LoginProvider) as LoginProvider)
          .loginBloc;
}
