import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav_state/fav_selectors.dart';
import 'package:redux/redux.dart';

class NewsPageVM {
  final List<ArticlesDto> articlesDto;
  final void Function(ArticlesDto news) addFav;
  final void Function(ArticlesDto news) deleteFav;

  const NewsPageVM({
    required this.articlesDto,
    required this.addFav,
    required this.deleteFav,
  });

  static NewsPageVM init(Store<AppState> store) {
    return NewsPageVM(

      addFav: FavSelectors.addF(store),
      deleteFav: FavSelectors.deleteF(store),
      articlesDto: FavSelectors.getFav(store),
    );
  }
}
