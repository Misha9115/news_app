import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_paper/store/base_action.dart';

class LoginAction extends BaseAction {
  final String email;
  final String password;

  LoginAction({
    required this.email,
    required this.password,
  }) : super(type: 'LoginAction');
}

class SaveUserAction extends BaseAction {
  User user;

  SaveUserAction({
    required this.user,
  }) : super(type: 'SaveUserAction');
}

class SaveUserWIthGoogleAction extends BaseAction {
  String user;

  SaveUserWIthGoogleAction({
    required this.user,
  }) : super(type: 'SaveUserAction');
}

class RegistrationAction extends BaseAction {
  final String email;
  final String password;

  RegistrationAction({
    required this.email,
    required this.password,
  }) : super(type: 'RegistrationAction');
}

class RegistrationWithGoogleAction extends BaseAction {
  RegistrationWithGoogleAction() : super(type: 'RegistrationWithGoogleAction');
}

class LoginWithGoogleAction extends BaseAction {
  LoginWithGoogleAction() : super(type: 'LoginWithGoogleAction');
}
