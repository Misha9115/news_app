import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/loader_state/loader_selector.dart';
import 'package:news_paper/store/search_news_state/search_news_selcor.dart';
import 'package:redux/redux.dart';

class SearchPageVM {
  final void Function(int page, String searchRequest) changePage;
  final int page;
  final void Function(int pageSize, String searchReqest) getSearchNews;
  final List<ArticlesDto> newsList;
  final void Function(int page) changeNewsPage;
  final void Function(int pageSize, String searchReqest) pagination;
  final bool paginationLoader;


  const SearchPageVM({
    required this.changePage,
    required this.page,
    required this.getSearchNews,
    required this.newsList,
    required this.changeNewsPage,
    required this.pagination,
    required this.paginationLoader,
  });

  static SearchPageVM init(Store<AppState> store) {
    return SearchPageVM(
      changePage: SearchNewsSelectors.changePageAction(store),
      page: SearchNewsSelectors.getPages(store),
      getSearchNews: SearchNewsSelectors.getRequestNews(store),
      newsList: SearchNewsSelectors.getNews(store),
      changeNewsPage: SearchNewsSelectors.changeSearchPageAction(store),
      pagination: SearchNewsSelectors.paginationSearchNews(store),
      paginationLoader: LoaderSelectors.getPaginationLoader(store),

    );
  }
}