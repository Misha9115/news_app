import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/news/news_actions.dart';
import 'package:news_paper/store/news/news_state.dart';

NewsState mewsReducer(NewsState state, dynamic action) {
  if (action is SaveNewsAction) {
    return _saveNewsAction(state, action);
  } else if (action is ClearNewsAction) {
    return _clearNewsAction(state, action);
  } else if (action is AddNewsAction) {
    return _addNewsAction(state, action);
  } else if (action is ChangePageAction) {
    return _changePageAction(state, action);
  }

  return state;
}

NewsState _saveNewsAction(NewsState state, SaveNewsAction action) {
  return state.copyWith(newsListDto: action.news);
}

NewsState _clearNewsAction(NewsState state, ClearNewsAction action) {
  return state.copyWith(
    newsListDto: const NewsListDto(status: '', articles: [], totalResults: 0),
  );
}

NewsState _addNewsAction(NewsState state, AddNewsAction action) {
  return state.copyWith(
    newsListDto: NewsListDto(status: state.newsListDto.status, articles: action.news, totalResults: state.newsListDto.totalResults),
  );
}

NewsState _changePageAction(NewsState state, ChangePageAction action) {
  return state.copyWith(pageNumber: action.page);
}
