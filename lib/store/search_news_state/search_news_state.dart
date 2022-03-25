import 'dart:collection';

import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/reducer.dart';
import 'package:news_paper/store/search_news_state/action/change_number_search_page_action.dart';
import 'package:news_paper/store/search_news_state/action/clear_search_news_action.dart';
import 'package:news_paper/store/search_news_state/action/save_search_news_action.dart';

class SearchNewsState {
  final List<ArticlesDto> searchNewsListDto;
  final int pageNumber;

  factory SearchNewsState.initial() {
    return const SearchNewsState(
      searchNewsListDto: [],
      pageNumber: 1,
    );
  }

  const SearchNewsState({
    required this.searchNewsListDto,
    required this.pageNumber,
  });

  SearchNewsState copyWith({List<ArticlesDto>? searchNewsListDto, int? pageNumber}) {
    return SearchNewsState(
      searchNewsListDto: searchNewsListDto ?? this.searchNewsListDto,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  SearchNewsState reducer(dynamic action) {
    return Reducer<SearchNewsState>(
      actions: HashMap.from({
        SaveSearchNewsAction: (dynamic action) => _saveSearchNewsAction(action as SaveSearchNewsAction),
        ClearNewsSearchAction: (dynamic action) => _clearSearchNewsAction(action as ClearNewsSearchAction),
        ChangeNumberSearchPageAction: (dynamic action) => _changeNumberSearchPageAction(action as ChangeNumberSearchPageAction),
      }),
    ).updateState(action, this);
  }

  SearchNewsState _saveSearchNewsAction(SaveSearchNewsAction action) {
    return copyWith(searchNewsListDto: action.news);
  }

  SearchNewsState _clearSearchNewsAction(ClearNewsSearchAction action) {
    return copyWith(searchNewsListDto: []);
  }

  SearchNewsState _changeNumberSearchPageAction(ChangeNumberSearchPageAction action) {
    return copyWith(pageNumber: action.page);
  }
}
