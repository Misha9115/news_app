import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/network/i_chat_repository.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/loader_state/action/chenge_pagination_loader.dart';
import 'package:news_paper/store/search_news_state/action/change_search_page_action.dart';
import 'package:news_paper/store/search_news_state/action/clear_search_news_action.dart';
import 'package:news_paper/store/search_news_state/action/get_search_news_action.dart';
import 'package:news_paper/store/search_news_state/action/pagination_search_news_action.dart';
import 'package:news_paper/store/search_news_state/action/save_search_news_action.dart';
import 'package:news_paper/utils/locator.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class SearchNewsEpic {
  static const String tag = '[SearchNewsEpic]';
  static bool tryAgain = true;

  static final indexEpic = combineEpics<AppState>([_getSearchNews, _getNewsPagination, _getNewPage]);

  static Stream<dynamic> _getSearchNews(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetSearchNewsAction>().switchMap(
      (action) async* {
        NewsListDto? result = await getIt<IChatRepository>().getNewsWithParams(q: action.searchRequest, page: 1, pageSize: action.pageSize);

        yield* Stream.value(SaveSearchNewsAction(news: result.articles!));
      },
    );
  }

  static Stream<dynamic> _getNewsPagination(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<PaginationSearchNewsAction>().switchMap(
      (action) async* {
        yield* Stream.value(ChangePaginationLoader(paginationLoader: true));

        NewsListDto result =
            await getIt<IChatRepository>().getNewsWithParams(q: action.q, page: store.state.searchNewsState.pageNumber, pageSize: action.page);

        yield* Stream.value(SaveSearchNewsAction(news: result.articles!));

        yield* Stream.value(ChangePaginationLoader(paginationLoader: false));
      },
    );
  }

  static Stream<dynamic> _getNewPage(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<ChangeSearchPageAction>().switchMap(
      (action) async* {
        yield* Stream.value(ClearNewsSearchAction());

        NewsListDto result = await getIt<IChatRepository>().getNewsWithParams(pageSize: 20, q: action.request, page: action.page);
        yield* Stream.value(SaveSearchNewsAction(news: result.articles!));

        yield* Stream.value(ChangePaginationLoader(paginationLoader: false));
      },
    );
  }
}
