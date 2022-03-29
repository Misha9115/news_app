import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/fav/fav_actions.dart';
import 'package:news_paper/store/fav/fav_state.dart';
import 'package:news_paper/store/reducer.dart';
import 'dart:collection';

FavState favReducer(FavState state, dynamic action) {
  return Reducer<FavState>(
    actions: HashMap.from({
      SaveFavAction: (dynamic action, FavState state) => _saveFavAction(action as SaveFavAction, state),
      DeleteFavAction: (dynamic action, FavState state) => _deleteFavAction(action as DeleteFavAction, state),
      SaveListFavAction: (dynamic action, FavState state) => _saveFavListAction(action as SaveListFavAction, state),
    }),
  ).updateState(action, state);
}

FavState _saveFavAction(SaveFavAction action, FavState state) {
  List<ArticlesDto> add = [];
  add = state.articlesDto;
  add.add(action.news);

  return state.copyWith(articlesDto: add);
}

FavState _deleteFavAction(DeleteFavAction action, FavState state) {
  state.articlesDto.removeWhere((element) => element.url == action.news.url);
  return state.copyWith(
    articlesDto: state.articlesDto,
  );
}

FavState _saveFavListAction(SaveListFavAction action, FavState state) {
  return state.copyWith(articlesDto: action.news);
}
