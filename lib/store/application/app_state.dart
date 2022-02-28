import 'package:news_paper/store/fav_state/fav_state.dart';
import 'package:news_paper/store/loader_state/loader_state.dart';
import 'package:news_paper/store/news_state/news_epic.dart';
import 'package:news_paper/store/news_state/news_state.dart';
import 'package:news_paper/store/search_news_state/search_news_epic.dart';
import 'package:news_paper/store/search_news_state/search_news_state.dart';
import 'package:redux_epics/redux_epics.dart';

class AppState {
  final NewsState newsState;
  final LoaderState loaderState;
  final FavState favState;
  final SearchNewsState searchNewsState;

  AppState({
    required this.newsState,
    required this.loaderState,
    required this.favState,
    required this.searchNewsState,
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      newsState: NewsState.initial(),
      loaderState: LoaderState.initial(),
      favState: FavState.initial(),
      searchNewsState: SearchNewsState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      newsState: state.newsState.reducer(action),
      loaderState: state.loaderState.reducer(action),
      favState: state.favState.reducer(action),
      searchNewsState: state.searchNewsState.reducer(action),
    );
  }

  ///In [getAppEpic], call the main epic.
  static final getAppEpic = combineEpics<AppState>([
    NewsEpic.indexEpic,
    SearchNewsEpic.indexEpic,
  ]);
}