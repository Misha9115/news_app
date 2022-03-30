import 'package:firebase_auth/firebase_auth.dart';

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
}
