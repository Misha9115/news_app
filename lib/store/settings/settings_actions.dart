import 'package:news_paper/store/base_action.dart';

class ChangeSettingsTheme extends BaseAction {
  final bool lightTheme;

  ChangeSettingsTheme({
    required this.lightTheme,
  }) : super(type: 'ChangeSettingsTheme');
}

class ChangeFontSize extends BaseAction {
  final double fontSize;

  ChangeFontSize({
    required this.fontSize,
  }) : super(type: 'ChangeFontSize');
}
