import 'package:news_paper/domain/entity/support_data.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:news_paper/store/support/support_selector.dart';
import 'package:redux/redux.dart';

class SupportPageVM {
  final List<SupportData> supportMassage ;
  final void Function(SupportData massage) addMassage;
  final bool isLight;
  final double fontSize;

  const SupportPageVM({
    required this.supportMassage,
    required this.addMassage,

    required this.isLight,
    required this.fontSize,
  });

  static SupportPageVM init(Store<AppState> store) {
    return SupportPageVM(
      addMassage: SupportSelectors.addMassage(store),
      supportMassage: SupportSelectors.getMassage(store),
      isLight: SettingsSelectors.getTheme(store),
      fontSize: SettingsSelectors.getFontSize(store),
    );
  }
}
