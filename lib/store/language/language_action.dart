import 'package:news_paper/store/base_action.dart';

class ChangeLanguage extends BaseAction {
  final String locale;

  ChangeLanguage({
    required this.locale,
  }) : super(type: 'ChangeLanguage');
}
