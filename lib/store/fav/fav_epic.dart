import 'package:firebase_database/firebase_database.dart';
import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/network/news_dao.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav/fav_actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class FavEpic {
  static const String tag = '[LoginEpic]';
  static bool tryAgain = true;

  static final indexEpic = combineEpics<AppState>([_sendData, _getData, _deleteOnePost]);

  static Stream<dynamic> _sendData(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<SaveToDataBaseAction>().switchMap(
      (action) async* {
        final newsDao = NewsDao();
        newsDao.saveNews(action.news, store.state.loginState.user!.uid);
      },
    );
  }

  static Stream<dynamic> _getData(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetDataRomDataBaseAction>().switchMap(
      (action) async* {
        final newsDao = NewsDao();
        DataSnapshot event = await newsDao.getNewsQuery(store.state.loginState.user!.uid).get();
        List<ArticlesDto> news = [];
        ArticlesDto oneNews;
        Map<dynamic, dynamic> values = event.value;

        values.forEach((key, values) {
          oneNews = ArticlesDto(
            author: values["author"],
            content: values["content"],
            description: values["description"],
            publishedAt: values["publishedAt"],
            title: values["title"],
            url: values["url"],
            urlToImage: values["urlToImage"],
          );
          news.add(oneNews);
        });
        yield* Stream.value(SaveListFavAction(news: news));
      },
    );
  }

  static Stream<dynamic> _deleteOnePost(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DeleteFavAction>().switchMap(
      (action) async* {
        final newsDao = NewsDao();
        String keyS = '';
        DataSnapshot event = await newsDao.getNewsQuery(store.state.loginState.user!.uid).get();
        Map<dynamic, dynamic> values = event.value;
        values.forEach((key, values) {
          if (key == store.state.loginState.user!.uid) {
            values.forEach((key, values) {
              if (values["url"] == action.news.url) {
                keyS = key;
              }
            });
          }
        });
        newsDao.deleteNews(keyS, store.state.loginState.user!.uid);
      },
    );
  }
}
