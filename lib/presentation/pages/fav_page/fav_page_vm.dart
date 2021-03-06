import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav/fav_selectors.dart';
import 'package:news_paper/store/news/news_selector.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class FavPageVM {
  final NewsListDto newsList;
  final List<ArticlesDto> articlesDto;
  final void Function(ArticlesDto news) addFav;
  final void Function(ArticlesDto news) deleteFav;
  final void Function() getDataFromDataBase;
  final bool isLight;
  final double fontSize;

  const FavPageVM({
    required this.newsList,
    required this.articlesDto,
    required this.addFav,
    required this.deleteFav,
    required this.getDataFromDataBase,
    required this.isLight,
    required this.fontSize,
  });

  static FavPageVM init(Store<AppState> store) {
    return FavPageVM(
      newsList: NewsSelectors.getNews(store),
      addFav: FavSelectors.addF(store),
      deleteFav: FavSelectors.deleteF(store),
      articlesDto: FavSelectors.getFav(store),
      getDataFromDataBase: FavSelectors.getData(store),
      isLight: SettingsSelectors.getTheme(store),
      fontSize: SettingsSelectors.getFontSize(store),
    );
  }
}
