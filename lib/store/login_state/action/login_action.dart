import 'package:news_paper/store/base_action.dart';

class LoginAction extends BaseAction {
  final String email;
  final String password;

  LoginAction({
    required this.email,
    required this.password,
  }) : super(type: 'LoginAction');
}
