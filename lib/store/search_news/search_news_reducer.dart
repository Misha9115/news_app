import 'dart:collection';

import 'package:news_paper/store/reducer.dart';
import 'package:news_paper/store/search_news/search_news_actions.dart';
import 'package:news_paper/store/search_news/search_news_state.dart';

SearchNewsState searchNewsReducer(SearchNewsState state, dynamic action) {
  // return Reducer<SearchNewsState>(
  //   actions: HashMap.from({
  //     SaveSearchNewsAction: (dynamic action, SearchNewsState state) =>
  //         _saveSearchNewsAction(action as SaveSearchNewsAction, state as SearchNewsState),
  //     ClearNewsSearchAction: (dynamic action, SearchNewsState state) =>
  //         _clearSearchNewsAction(action as ClearNewsSearchAction, state as SearchNewsState),
  //     ChangeNumberSearchPageAction: (dynamic action, SearchNewsState state) =>
  //         _changeNumberSearchPageAction(action as ChangeNumberSearchPageAction, state as SearchNewsState),
  //   }),
  // ).updateState(action, state);
  if (action is SaveSearchNewsAction) {
    return _saveSearchNewsAction(state, action);
  } else if (action is ClearNewsSearchAction) {
    return _clearSearchNewsAction(state, action);
  } else if (action is ChangeNumberSearchPageAction) {
    return _changeNumberSearchPageAction(state, action);
  }

  return state;
}

SearchNewsState _saveSearchNewsAction(SearchNewsState state, SaveSearchNewsAction action) {
  return state.copyWith(searchNewsListDto: action.news);
}

SearchNewsState _clearSearchNewsAction(SearchNewsState state, ClearNewsSearchAction action) {
  return state.copyWith(searchNewsListDto: []);
}

SearchNewsState _changeNumberSearchPageAction(SearchNewsState state, ChangeNumberSearchPageAction action) {
  return state.copyWith(pageNumber: action.page);
}
