import 'package:news_paper/store/search_news/search_news_actions.dart';
import 'package:news_paper/store/search_news/search_news_state.dart';

SearchNewsState searchNewsReducer(SearchNewsState state, dynamic action) {
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
