import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/loader/loader_selector.dart';
import 'package:news_paper/store/news/news_selector.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class HomePageVM {
  final void Function() getNews;
  final NewsListDto newsList;
  final bool isPaginationLoading;
  final void Function(int pageSize) getPagination;
  final void Function(int page) changePage;
  final int page;
  final bool isLight;
  final double fontSize;

  const HomePageVM(
      {required this.getNews,
      required this.newsList,
      required this.isPaginationLoading,
      required this.getPagination,
      required this.changePage,
      required this.page,
      required this.isLight,
      required this.fontSize});

  static HomePageVM init(Store<AppState> store) {
    return HomePageVM(
      getNews: NewsSelectors.getQetNews(store),
      newsList: NewsSelectors.getNews(store),
      isPaginationLoading: LoaderSelectors.getPaginationLoader(store),
      getPagination: NewsSelectors.getPaginationNews(store),
      changePage: NewsSelectors.changePageAction(store),
      page: NewsSelectors.getPages(store),
      isLight: SettingsSelectors.getTheme(store),
      fontSize: SettingsSelectors.getFontSize(store),
    );
  }
}
