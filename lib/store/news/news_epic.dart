import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/network/news_repository.dart';
import 'package:news_paper/shared/locator.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/loader/loader_actions.dart';
import 'package:news_paper/store/news/news_actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class NewsEpic {
  static const String tag = '[NewsEpic]';
  static bool tryAgain = true;

  static final indexEpic = combineEpics<AppState>([_getNews, _getNewsPagination, _getNewPage]);

  static Stream<dynamic> _getNews(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetNewsAction>().switchMap(
      (action) async* {
        NewsListDto? result = await getIt<NewsRepository>().getNews();

        yield* Stream.value(SaveNewsAction(news: result));
      },
    );
  }

  static Stream<dynamic> _getNewsPagination(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetPaginationAction>().switchMap(
      (action) async* {
        yield* Stream.value(ChangePaginationLoader(paginationLoader: true));
        int page = store.state.newsState.pageNumber;

        NewsListDto result = await getIt<NewsRepository>().getNewsWithPagination(pageSize: action.pageSize, page: page);

        yield* Stream.value(AddNewsAction(news: result.articles!));

        yield* Stream.value(ChangePaginationLoader(paginationLoader: false));
      },
    );
  }

  static Stream<dynamic> _getNewPage(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<ChangePageAction>().switchMap(
      (action) async* {
        yield* Stream.value(ClearNewsAction());

        NewsListDto result = await getIt<NewsRepository>().getNewsWithPagination(pageSize: 20, page: action.page);

        yield* Stream.value(SaveNewsAction(news: result));

        yield* Stream.value(ChangePaginationLoader(paginationLoader: false));
      },
    );
  }
}
