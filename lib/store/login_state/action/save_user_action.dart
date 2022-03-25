import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_paper/store/base_action.dart';

class SaveUserAction extends BaseAction {
  User user;

  SaveUserAction({
    required this.user,
  }) : super(type: 'SaveUserAction');
}
