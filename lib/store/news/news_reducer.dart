import 'dart:collection';

import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/news/news_actions.dart';
import 'package:news_paper/store/news/news_state.dart';
import 'package:news_paper/store/reducer.dart';

NewsState mewsReducer( NewsState state,dynamic action) {
  return Reducer<NewsState>(
    actions: HashMap.from({
      SaveNewsAction: (dynamic action, NewsState state) => _saveNewsAction(action as SaveNewsAction, state),
      ClearNewsAction: (dynamic action, NewsState state) => _clearNewsAction(action as ClearNewsAction, state),
      AddNewsAction: (dynamic action, NewsState state) => _addNewsAction(action as AddNewsAction, state),
      ChangePageAction: (dynamic action, NewsState state) => _changePageAction(action as ChangePageAction, state),
    }),
  ).updateState(action, state);
}

NewsState _saveNewsAction(SaveNewsAction action, NewsState state) {
  return state.copyWith(newsListDto: action.news);
}

NewsState _clearNewsAction(ClearNewsAction action, NewsState state) {
  return state.copyWith(
    newsListDto: const NewsListDto(status: '', articles: [], totalResults: 0),
  );
}

NewsState _addNewsAction(AddNewsAction action, NewsState state) {
  return state.copyWith(
    newsListDto: NewsListDto(status: state.newsListDto.status, articles: action.news, totalResults: state.newsListDto.totalResults),
  );
}

NewsState _changePageAction(ChangePageAction action, NewsState state) {
  return state.copyWith(pageNumber: action.page);
}
