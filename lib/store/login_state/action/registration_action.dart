import 'package:news_paper/store/base_action.dart';

class RegistrationAction extends BaseAction {
  final String email;
  final String password;

  RegistrationAction({
    required this.email,
    required this.password,
  }) : super(type: 'RegistrationAction');
}
