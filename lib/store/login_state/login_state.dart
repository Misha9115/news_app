import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_paper/store/login_state/action/save_user_action.dart';
import 'package:news_paper/store/reducer.dart';

class LoginState {
  final bool isLogin;
  final User? user;

  factory LoginState.initial() {
    return LoginState(isLogin: false, user: null);
  }

  LoginState({
    required this.isLogin,
    this.user,
  });

  LoginState copyWith({bool? isLogin, User? user}) {
    return LoginState(isLogin: isLogin ?? this.isLogin, user: user ?? this.user);
  }

  LoginState reducer(dynamic action) {
    return Reducer<LoginState>(
      actions: HashMap.from({
        SaveUserAction: (dynamic action) => _saveUserAction(action as SaveUserAction),
      }),
    ).updateState(action, this);
  }

  LoginState _saveUserAction(SaveUserAction action) {
    return copyWith(user: action.user);
  }
}
