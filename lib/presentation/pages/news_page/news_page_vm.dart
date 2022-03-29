import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav/fav_selectors.dart';
import 'package:redux/redux.dart';

class NewsPageVM {
  final List<ArticlesDto> articlesDto;
  final void Function(ArticlesDto news) addFav;
  final void Function(ArticlesDto news) deleteFav;
  final void Function(ArticlesDto news) saveToDataBase;

  const NewsPageVM({
    required this.articlesDto,
    required this.addFav,
    required this.deleteFav,
    required this.saveToDataBase,
  });

  static NewsPageVM init(Store<AppState> store) {
    return NewsPageVM(
      addFav: FavSelectors.addF(store),
      deleteFav: FavSelectors.deleteF(store),
      articlesDto: FavSelectors.getFav(store),
      saveToDataBase: FavSelectors.saveToDataBase(store),
    );
  }
}
