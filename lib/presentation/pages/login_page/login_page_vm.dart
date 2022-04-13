import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/login/login_selector.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class LoginPageVM {
  final bool isLogin;
  final void Function(String email, String password) registration;
  final void Function(String email, String password) login;
  final void Function() registrationWithGoogle;
  final void Function() loginWithGoogle;
  final double fontSize;

  const LoginPageVM({
    required this.isLogin,
    required this.registration,
    required this.login,
    required this.loginWithGoogle,
    required this.registrationWithGoogle,
    required this.fontSize,
  });

  static LoginPageVM init(Store<AppState> store) {
    return LoginPageVM(
      isLogin: LoginSelectors.getLogin(store),
      registration: LoginSelectors.registration(store),
      login: LoginSelectors.login(store),
      loginWithGoogle: LoginSelectors.loginWithGoogle(store),
      registrationWithGoogle: LoginSelectors.registrationWithGoogle(store),
      fontSize: SettingsSelectors.getFontSize(store),
    );
  }
}
