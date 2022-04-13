import 'package:firebase_auth/firebase_auth.dart';

class LoginState {
  final bool isLogin;
  final User? user;
  final String? userId;

  factory LoginState.initial() {
    return LoginState(isLogin: false, user: null, userId: null);
  }

  LoginState({
    required this.isLogin,
    this.user,
    this.userId,
  });

  LoginState copyWith({bool? isLogin, User? user, String? userId}) {
    return LoginState(
      isLogin: isLogin ?? this.isLogin,
      user: user ?? this.user,
      userId: userId ?? this.userId,
    );
  }
}
