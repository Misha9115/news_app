import 'package:news_paper/store/loader/loader_actions.dart';
import 'package:news_paper/store/loader/loader_state.dart';

LoaderState loaderReducer(LoaderState state, dynamic action) {
  if (action is ChangePaginationLoader) {
    return _savePaginationAction(state, action);
  }

  return state;
}

LoaderState _savePaginationAction(LoaderState state, ChangePaginationLoader action) {
  return state.copyWith(paginationLoader: action.paginationLoader);
}
