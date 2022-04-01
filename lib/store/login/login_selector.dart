import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/login/login_actions.dart';
import 'package:redux/redux.dart';

abstract class LoginSelectors {
  static bool getLogin(Store<AppState> store) {
    return store.state.loginState.isLogin;
  }

  static void Function(String email, String password) registration(Store<AppState> store) {
    return (String email, String password) => store.dispatch(RegistrationAction(email: email, password: password));
  }

  static void Function(String email, String password) login(Store<AppState> store) {
    return (String email, String password) => store.dispatch(LoginAction(email: email, password: password));
  }

  static void Function( ) registrationWithGoogle(Store<AppState> store) {
    return () => store.dispatch(RegistrationWithGoogleAction());
  }

  static void Function() loginWithGoogle(Store<AppState> store) {
    return () => store.dispatch(LoginWithGoogleAction());
  }
}
