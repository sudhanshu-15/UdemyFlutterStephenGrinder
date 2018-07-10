import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>(seedValue: '');
  final _passwordController = BehaviorSubject<String>(seedValue: '');

  //Change data
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  //Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

  void submitForm() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email is $validEmail and password is $validPassword');
  }
}
