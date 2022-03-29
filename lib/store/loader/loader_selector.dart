import 'package:news_paper/store/application/app_state.dart';
import 'package:redux/redux.dart';

abstract class LoaderSelectors {
  static bool getPaginationLoader(Store<AppState> store) {
    return store.state.loaderState.paginationLoader;
  }
}
