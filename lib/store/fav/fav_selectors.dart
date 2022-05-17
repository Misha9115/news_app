import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav/fav_actions.dart';
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
  static void Function(ArticlesDto news) saveToDataBase(Store<AppState> store) {
    return (ArticlesDto news) => store.dispatch(SaveToDataBaseAction(news: news));
  }


  static void Function() getData(Store<AppState> store) {
    return () => store.dispatch(GetDataRomDataBaseAction());
  }
}
