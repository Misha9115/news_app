import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/domain/service/analitics_service.dart';
import 'package:news_paper/network/news_repository.dart';
import 'package:news_paper/shared/locator.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/loader/loader_actions.dart';
import 'package:news_paper/store/search_news/search_news_actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class SearchNewsEpic {
  static const String tag = '[SearchNewsEpic]';
  static bool tryAgain = true;

  static final indexEpic = combineEpics<AppState>([_getSearchNews, _getNewsPagination, _getNewPage]);

  static Stream<dynamic> _getSearchNews(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetSearchNewsAction>().switchMap(
      (action) async* {
        final AnalyticService _analyticsService = getIt<AnalyticService>();
        NewsListDto? result = await getIt<NewsRepository>().getNewsWithParams(q: action.searchRequest, page: 1, pageSize: action.pageSize);
        if (store.state.loginState.userId != null) {
          _analyticsService.searchNews(userID: store.state.loginState.userId!, searchRequest: action.searchRequest);
        } else {
          _analyticsService.searchNews(userID: store.state.loginState.user!.uid, searchRequest: action.searchRequest);
        }

        yield* Stream.value(SaveSearchNewsAction(news: result.articles!));
      },
    );
  }

  static Stream<dynamic> _getNewsPagination(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<PaginationSearchNewsAction>().switchMap(
      (action) async* {
        yield* Stream.value(ChangePaginationLoader(paginationLoader: true));

        NewsListDto result =
            await getIt<NewsRepository>().getNewsWithParams(q: action.q, page: store.state.searchNewsState.pageNumber, pageSize: action.page);

        yield* Stream.value(SaveSearchNewsAction(news: result.articles!));

        yield* Stream.value(ChangePaginationLoader(paginationLoader: false));
      },
    );
  }

  static Stream<dynamic> _getNewPage(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<ChangeSearchPageAction>().switchMap(
      (action) async* {
        yield* Stream.value(ClearNewsSearchAction());

        NewsListDto result = await getIt<NewsRepository>().getNewsWithParams(pageSize: 20, q: action.request, page: action.page);
        yield* Stream.value(SaveSearchNewsAction(news: result.articles!));

        yield* Stream.value(ChangePaginationLoader(paginationLoader: false));
      },
    );
  }
}
