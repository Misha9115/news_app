import 'dart:collection';

import 'package:news_paper/store/reducer.dart';
import 'package:news_paper/store/search_news/search_news_actions.dart';
import 'package:news_paper/store/search_news/search_news_state.dart';

SearchNewsState searchNewsReducer( SearchNewsState state,dynamic action) {
  return Reducer<SearchNewsState>(
    actions: HashMap.from({
      SaveSearchNewsAction: (dynamic action, SearchNewsState state) =>
          _saveSearchNewsAction(action as SaveSearchNewsAction, state as SearchNewsState),
      ClearNewsSearchAction: (dynamic action, SearchNewsState state) =>
          _clearSearchNewsAction(action as ClearNewsSearchAction, state as SearchNewsState),
      ChangeNumberSearchPageAction: (dynamic action, SearchNewsState state) =>
          _changeNumberSearchPageAction(action as ChangeNumberSearchPageAction, state as SearchNewsState),
    }),
  ).updateState(action, state);
}

SearchNewsState _saveSearchNewsAction(SaveSearchNewsAction action, SearchNewsState state) {
  return state.copyWith(searchNewsListDto: action.news);
}

SearchNewsState _clearSearchNewsAction(ClearNewsSearchAction action, SearchNewsState state) {
  return state.copyWith(searchNewsListDto: []);
}

SearchNewsState _changeNumberSearchPageAction(ChangeNumberSearchPageAction action, SearchNewsState state) {
  return state.copyWith(pageNumber: action.page);
}
