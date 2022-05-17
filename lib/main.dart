import 'package:flutter/material.dart';
import 'package:news_paper/domain/service/globals.dart';
import 'package:news_paper/presentation/aplication/aplication.dart';
import 'package:news_paper/shared/init.dart';
import 'package:news_paper/shared/locator.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Globals.init();

  await InitApp.init();
  final Store<AppState> store = Store<AppState>(
    AppState.getReducer,
    initialState: AppState.initial(),
    middleware: [
      EpicMiddleware(AppState.getAppEpic),
    ],
  );
  setupLocator();
  runApp(
    Application(store: store),
  );
}
