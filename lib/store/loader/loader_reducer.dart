import 'dart:collection';

import 'package:news_paper/store/loader/loader_actions.dart';
import 'package:news_paper/store/loader/loader_state.dart';
import 'package:news_paper/store/reducer.dart';

LoaderState loaderReducer(LoaderState state ,dynamic action ) {
  return Reducer<LoaderState>(
    actions: HashMap.from({
      ChangePaginationLoader: (LoaderState state ,dynamic action) => _savePaginationAction(state, action as ChangePaginationLoader ),
    }),
  ).updateState(action, state);
}

LoaderState _savePaginationAction( LoaderState state, ChangePaginationLoader action) {
  return state.copyWith(paginationLoader: action.paginationLoader);
}
