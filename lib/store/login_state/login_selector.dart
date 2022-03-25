import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/login_state/action/login_action.dart';
import 'package:news_paper/store/login_state/action/registration_action.dart';
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
}
