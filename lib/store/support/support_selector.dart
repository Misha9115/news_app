import 'package:news_paper/domain/entity/support_data.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/support/support_action.dart';
import 'package:redux/redux.dart';

abstract class SupportSelectors {
  static void Function(SupportData massage) addMassage(Store<AppState> store) {
    return (SupportData massage) => store.dispatch(AddMassageAction(massage: massage));
  }

  static List<SupportData> getMassage(Store<AppState> store) {
    return store.state.supportState.supportList;
  }
}
