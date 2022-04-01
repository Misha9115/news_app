import 'package:news_paper/store/login/login_actions.dart';
import 'package:news_paper/store/login/login_state.dart';

LoginState loginReducer(LoginState state, dynamic action) {
  if (action is SaveUserAction) {
    return _saveUserAction(state, action);
  }
  else if (action is SaveUserWIthGoogleAction) {
    return _saveUserWithGoogleAction(state, action);
  }
  return state;
}

LoginState _saveUserAction(LoginState state, SaveUserAction action) {
  return state.copyWith(user: action.user);
}
LoginState _saveUserWithGoogleAction(LoginState state, SaveUserWIthGoogleAction action) {
  return state.copyWith(userId: action.user.substring(1, 25));
}