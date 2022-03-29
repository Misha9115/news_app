import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/news/news_actions.dart';
import 'package:redux/redux.dart';

abstract class NewsSelectors {
  static void Function() getLibrariesFavoriteCountFunction(Store<AppState> store) {
    return () => store.dispatch(GetNewsAction());
  }

  static void Function(int pageSize) getPaginationNews(Store<AppState> store) {
    return (int pageSize) => store.dispatch(GetPaginationAction(pageSize: pageSize));
  }

  static void Function(int page) changePageAction(Store<AppState> store) {
    return (int page) => store.dispatch(ChangePageAction(page: page));
  }

  static NewsListDto getNews(Store<AppState> store) {
    return store.state.newsState.newsListDto;
  }

  static int getPages(Store<AppState> store) {
    return store.state.newsState.pageNumber;
  }
}
