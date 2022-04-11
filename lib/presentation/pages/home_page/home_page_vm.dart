import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/loader/loader_selector.dart';
import 'package:news_paper/store/news/news_selector.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class HomePageVM {
  final void Function() getBooks;
  final NewsListDto newsList;
  final bool paginationLoader;
  final void Function(int pageSize) getPagination;
  final void Function(int page) changePage;
  final int page;
  final bool light;

  const HomePageVM({
    required this.getBooks,
    required this.newsList,
    required this.paginationLoader,
    required this.getPagination,
    required this.changePage,
    required this.page,
    required this.light,
  });

  static HomePageVM init(Store<AppState> store) {
    return HomePageVM(
      getBooks: NewsSelectors.getLibrariesFavoriteCountFunction(store),
      newsList: NewsSelectors.getNews(store),
      paginationLoader: LoaderSelectors.getPaginationLoader(store),
      getPagination: NewsSelectors.getPaginationNews(store),
      changePage: NewsSelectors.changePageAction(store),
      page: NewsSelectors.getPages(store),
      light: SettingsSelectors.getTheme(store),
    );
  }
}
