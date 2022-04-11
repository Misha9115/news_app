import 'package:news_paper/store/base_action.dart';

class ChangeSettingsTheme extends BaseAction {
  final bool lightTheme;

  ChangeSettingsTheme({
    required this.lightTheme,
  }) : super(type: 'ChangeSettingsTheme');
}
