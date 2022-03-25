import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav_state/fav_selectors.dart';
import 'package:news_paper/store/news_state/news_selector.dart';
import 'package:redux/redux.dart';

class FavPageVM {
  final NewsListDto newsList;
  final List<ArticlesDto> articlesDto;
  final void Function(ArticlesDto news) addFav;
  final void Function(ArticlesDto news) deleteFav;
  final void Function() getDataFromDataBase;

  const FavPageVM({
    required this.newsList,
    required this.articlesDto,
    required this.addFav,
    required this.deleteFav,
    required this.getDataFromDataBase,
  });

  static FavPageVM init(Store<AppState> store) {
    return FavPageVM(
      newsList: NewsSelectors.getNews(store),
      addFav: FavSelectors.addF(store),
      deleteFav: FavSelectors.deleteF(store),
      articlesDto: FavSelectors.getFav(store),
      getDataFromDataBase: FavSelectors.getData(store),
    );
  }
}
