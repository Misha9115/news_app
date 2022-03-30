import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/fav/fav_actions.dart';
import 'package:news_paper/store/fav/fav_state.dart';

FavState favReducer(FavState state, dynamic action) {
  if (action is SaveFavAction) {
    return _saveFavAction(state, action);
  } else if (action is DeleteFavAction) {
    return _deleteFavAction(state, action);
  } else if (action is SaveListFavAction) {
    return _saveFavListAction(state, action);
  }

  return state;
}

FavState _saveFavAction(FavState state, SaveFavAction action) {
  List<ArticlesDto> add = [];
  add = state.articlesDto;
  add.add(action.news);

  return state.copyWith(articlesDto: add);
}

FavState _deleteFavAction(FavState state, DeleteFavAction action) {
  state.articlesDto.removeWhere((element) => element.url == action.news.url);
  return state.copyWith(
    articlesDto: state.articlesDto,
  );
}

FavState _saveFavListAction(FavState state, SaveListFavAction action) {
  return state.copyWith(articlesDto: action.news);
}
