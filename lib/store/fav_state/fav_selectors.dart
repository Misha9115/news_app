import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav_state/actions/delete_fav_action.dart';
import 'package:news_paper/store/fav_state/actions/save_fav_action.dart';
import 'package:redux/redux.dart';

abstract class FavSelectors {
  static void Function(ArticlesDto news) deleteF(Store<AppState> store) {
    return (ArticlesDto news) => store.dispatch(DeleteFavAction(news: news));
  }

  static void Function(ArticlesDto news) addF(Store<AppState> store) {
    return (ArticlesDto news) => store.dispatch(SaveFavAction(news: news));
  }

  static List<ArticlesDto> getFav(Store<AppState> store) {
    return store.state.favState.articlesDto;
  }
}
