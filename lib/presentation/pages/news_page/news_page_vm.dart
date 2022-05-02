import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav/fav_selectors.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class NewsPageVM {
  final List<ArticlesDto> articlesDto;
  final void Function(ArticlesDto news) addFav;
  final void Function(ArticlesDto news) deleteFav;
  final void Function(ArticlesDto news) saveToDataBase;
  final bool isLight;
  final double fontSize;

  const NewsPageVM({
    required this.articlesDto,
    required this.addFav,
    required this.deleteFav,
    required this.saveToDataBase,
    required this.isLight,
    required this.fontSize,
  });

  static NewsPageVM init(Store<AppState> store) {
    return NewsPageVM(
      addFav: FavSelectors.addF(store),
      deleteFav: FavSelectors.deleteF(store),
      articlesDto: FavSelectors.getFav(store),
      saveToDataBase: FavSelectors.saveToDataBase(store),
      isLight: SettingsSelectors.getTheme(store),
      fontSize: SettingsSelectors.getFontSize(store),
    );
  }
}
