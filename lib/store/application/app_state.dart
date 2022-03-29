import 'package:news_paper/store/fav/fav_epic.dart';
import 'package:news_paper/store/fav/fav_state.dart';
import 'package:news_paper/store/loader/loader_state.dart';
import 'package:news_paper/store/login/login_epic.dart';
import 'package:news_paper/store/login/login_state.dart';
import 'package:news_paper/store/news/news_epic.dart';
import 'package:news_paper/store/news/news_state.dart';
import 'package:news_paper/store/search_news/search_news_epic.dart';
import 'package:news_paper/store/search_news/search_news_state.dart';
import 'package:redux_epics/redux_epics.dart';

class AppState {
  final NewsState newsState;
  final LoaderState loaderState;
  final FavState favState;
  final SearchNewsState searchNewsState;
  final LoginState loginState;

  AppState({
    required this.newsState,
    required this.loaderState,
    required this.favState,
    required this.searchNewsState,
    required this.loginState,
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      newsState: NewsState.initial(),
      loaderState: LoaderState.initial(),
      favState: FavState.initial(),
      searchNewsState: SearchNewsState.initial(),
      loginState: LoginState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      newsState: state.newsState.reducer(action),
      loaderState: state.loaderState.reducer(action),
      searchNewsState: state.searchNewsState.reducer(action),
      loginState: state.loginState.reducer(action),
      favState: state.favState.reducer(action),
    );
  }

  ///In [getAppEpic], call the main epic.
  static final getAppEpic = combineEpics<AppState>([
    NewsEpic.indexEpic,
    SearchNewsEpic.indexEpic,
    LoginEpic.indexEpic,
    FavEpic.indexEpic,
  ]);
}
