import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/search_news_state/action/change_number_search_page_action.dart';
import 'package:news_paper/store/search_news_state/action/change_search_page_action.dart';
import 'package:news_paper/store/search_news_state/action/get_search_news_action.dart';
import 'package:news_paper/store/search_news_state/action/pagination_search_news_action.dart';
import 'package:redux/redux.dart';

abstract class SearchNewsSelectors {
  static void Function(int pageSize, String searchRequest) getRequestNews(Store<AppState> store) {
    return (int pageSize, String searchRequest) => store.dispatch(GetSearchNewsAction(pageSize: pageSize, searchRequest: searchRequest));
  }

  static void Function(int page, String searchRequest) changePageAction(Store<AppState> store) {
    return (int page, String searchRequest) => store.dispatch(ChangeSearchPageAction(page: page, request: searchRequest));
  }

  static void Function(int page) changeSearchPageAction(Store<AppState> store) {
    return (int page) => store.dispatch(ChangeNumberSearchPageAction(page: page));
  }

  static void Function(int pageSize, String searchRequest) paginationSearchNews(Store<AppState> store) {
    return (int pageSize, String searchRequest) => store.dispatch(PaginationSearchNewsAction(page: pageSize, q: searchRequest));
  }

  static List<ArticlesDto> getNews(Store<AppState> store) {
    return store.state.searchNewsState.searchNewsListDto;
  }

  static int getPages(Store<AppState> store) {
    return store.state.searchNewsState.pageNumber;
  }
}
