import 'package:news_paper/store/login/login_actions.dart';
import 'package:news_paper/store/login/login_state.dart';

LoginState loginReducer(LoginState state, dynamic action) {
  if (action is SaveUserAction) {
    return _saveUserAction(state, action);
  }

  return state;
}

LoginState _saveUserAction(LoginState state, SaveUserAction action) {
  return state.copyWith(user: action.user);
}
