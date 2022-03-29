import 'dart:collection';

import 'package:news_paper/store/login/login_actions.dart';
import 'package:news_paper/store/login/login_state.dart';
import 'package:news_paper/store/reducer.dart';

LoginState loginReducer(LoginState state, dynamic action) {
  return Reducer<LoginState>(
    actions: HashMap.from({
      SaveUserAction: (dynamic action, LoginState state) => _saveUserAction(action as SaveUserAction, state),
    }),
  ).updateState(action, state);
}

LoginState _saveUserAction(SaveUserAction action, LoginState state) {
  return state.copyWith(user: action.user);
}
