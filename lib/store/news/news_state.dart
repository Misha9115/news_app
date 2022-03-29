import 'dart:collection';

import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/news/news_actions.dart';
import 'package:news_paper/store/reducer.dart';

class NewsState {
  final NewsListDto newsListDto;
  final int pageNumber;

  factory NewsState.initial() {
    return const NewsState(
        newsListDto: NewsListDto(
          totalResults: 0,
          status: '',
          articles: [],
        ),
        pageNumber: 1);
  }

  const NewsState({
    required this.newsListDto,
    required this.pageNumber,
  });

  NewsState copyWith({NewsListDto? newsListDto, int? pageNumber}) {
    return NewsState(
      newsListDto: newsListDto ?? this.newsListDto,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  NewsState reducer(dynamic action) {
    return Reducer<NewsState>(
      actions: HashMap.from({
        SaveNewsAction: (dynamic action) => _saveNewsAction(action as SaveNewsAction),
        ClearNewsAction: (dynamic action) => _clearNewsAction(action as ClearNewsAction),
        AddNewsAction: (dynamic action) => _addNewsAction(action as AddNewsAction),
        ChangePageAction: (dynamic action) => _changePageAction(action as ChangePageAction),
      }),
    ).updateState(action, this);
  }

  NewsState _saveNewsAction(SaveNewsAction action) {
    return copyWith(newsListDto: action.news);
  }

  NewsState _clearNewsAction(ClearNewsAction action) {
    return copyWith(
      newsListDto: const NewsListDto(status: '', articles: [], totalResults: 0),
    );
  }

  NewsState _addNewsAction(AddNewsAction action) {
    return copyWith(
      newsListDto: NewsListDto(status: newsListDto.status, articles: action.news, totalResults: newsListDto.totalResults),
    );
  }

  NewsState _changePageAction(ChangePageAction action) {
    return copyWith(pageNumber: action.page);
  }
}
