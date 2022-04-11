import 'package:news_paper/store/fav/fav_epic.dart';
import 'package:news_paper/store/fav/fav_reducer.dart';
import 'package:news_paper/store/fav/fav_state.dart';
import 'package:news_paper/store/language/language_reducer.dart';
import 'package:news_paper/store/language/language_state.dart';
import 'package:news_paper/store/loader/loader_reducer.dart';
import 'package:news_paper/store/loader/loader_state.dart';
import 'package:news_paper/store/login/login_epic.dart';
import 'package:news_paper/store/login/login_reducer.dart';
import 'package:news_paper/store/login/login_state.dart';
import 'package:news_paper/store/news/news_epic.dart';
import 'package:news_paper/store/news/news_reducer.dart';
import 'package:news_paper/store/news/news_state.dart';
import 'package:news_paper/store/search_news/search_news_epic.dart';
import 'package:news_paper/store/search_news/search_news_reducer.dart';
import 'package:news_paper/store/search_news/search_news_state.dart';
import 'package:news_paper/store/settings/settings_reducer.dart';
import 'package:news_paper/store/settings/settings_state.dart';
import 'package:redux_epics/redux_epics.dart';

class AppState {
  final NewsState newsState;
  final LoaderState loaderState;
  final FavState favState;
  final SearchNewsState searchNewsState;
  final LoginState loginState;
  final SettingsState settingsState;
  final LanguageState languageState;

  AppState({
    required this.newsState,
    required this.loaderState,
    required this.favState,
    required this.searchNewsState,
    required this.loginState,
    required this.settingsState,
    required this.languageState,
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      newsState: NewsState.initial(),
      loaderState: LoaderState.initial(),
      favState: FavState.initial(),
      searchNewsState: SearchNewsState.initial(),
      loginState: LoginState.initial(),
      settingsState: SettingsState.initial(),
      languageState: LanguageState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      loaderState: loaderReducer(state.loaderState, action),
      searchNewsState: searchNewsReducer(state.searchNewsState, action),
      loginState: loginReducer(state.loginState, action),
      favState: favReducer(state.favState, action),
      newsState: mewsReducer(state.newsState, action),
      settingsState:  settingsReducer(state.settingsState,action),
      languageState:  languageReducer(state.languageState,action),
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
