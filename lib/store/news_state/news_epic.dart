import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/network/i_chat_repository.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/loader_state/action/chenge_pagination_loader.dart';
import 'package:news_paper/store/news_state/action/add_news_action.dart';
import 'package:news_paper/store/news_state/action/change_page_action.dart';
import 'package:news_paper/store/news_state/action/clear_news_action.dart';
import 'package:news_paper/store/news_state/action/get_news_action.dart';
import 'package:news_paper/store/news_state/action/get_pagination_action.dart';
import 'package:news_paper/store/news_state/action/save_news_action.dart';
import 'package:news_paper/utils/locator.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class NewsEpic {
  static const String tag = '[NewsEpic]';
  static bool tryAgain = true;

  static final indexEpic = combineEpics<AppState>([_getNews, _getNewsPagination, _getNewPage]);

  static Stream<dynamic> _getNews(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetNewsAction>().switchMap(
      (action) async* {
        NewsListDto result = await getIt<IChatRepository>().getNews();

        if (result != null) {
          yield* Stream.value(SaveNewsAction(news: result));
        }
      },
    );
  }

  static Stream<dynamic> _getNewsPagination(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetPaginationAction>().switchMap(
      (action) async* {
        yield* Stream.value(ChangePaginationLoader(paginationLoader: true));

        NewsListDto result = await getIt<IChatRepository>().getNewsWithPagination(pageSize: action.pageSize, page: 1);

        if (result != null) {
          yield* Stream.value(AddNewsAction(news: result.articles!));
        }
        yield* Stream.value(ChangePaginationLoader(paginationLoader: false));
      },
    );
  }

  static Stream<dynamic> _getNewPage(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<ChangePageAction>().switchMap(
      (action) async* {
        yield* Stream.value(ClearNewsAction());

        NewsListDto result = await getIt<IChatRepository>().getNewsWithPagination(pageSize: 20, page: action.page);

        if (result != null) {
          yield* Stream.value(SaveNewsAction(news: result));
        }
        yield* Stream.value(ChangePaginationLoader(paginationLoader: false));
      },
    );
  }
}
