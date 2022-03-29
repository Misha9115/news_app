import 'dart:collection';

import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/fav/fav_actions.dart';
import 'package:news_paper/store/reducer.dart';

class FavState {
  final List<ArticlesDto> articlesDto;

  factory FavState.initial() {
    return FavState(articlesDto: <ArticlesDto>[]);
  }

  FavState({required this.articlesDto});

  FavState copyWith({List<ArticlesDto>? articlesDto}) {
    return FavState(
      articlesDto: articlesDto ?? this.articlesDto,
    );
  }

  FavState reducer(dynamic action) {
    return Reducer<FavState>(
      actions: HashMap.from({
        SaveFavAction: (dynamic action) => _saveFavAction(action as SaveFavAction),
        DeleteFavAction: (dynamic action) => _deleteFavAction(action as DeleteFavAction),
        SaveListFavAction: (dynamic action) => _saveFavListAction(action as SaveListFavAction),
      }),
    ).updateState(action, this);
  }

  FavState _saveFavAction(SaveFavAction action) {
    List<ArticlesDto> add = [];
    add = articlesDto;
    add.add(action.news);

    return copyWith(articlesDto: add);
  }

  FavState _deleteFavAction(DeleteFavAction action) {
    articlesDto.removeWhere((element) => element.url == action.news.url);
    return copyWith(
      articlesDto: articlesDto,
    );
  }

  FavState _saveFavListAction(SaveListFavAction action) {
    return copyWith(articlesDto: action.news);
  }
}
