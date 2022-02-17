import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/pages/home_page/home_page.dart';
import 'package:news_paper/res/app_routes.dart';
import 'package:news_paper/route_helper/route_helper.dart';
import 'package:news_paper/store/application/app_state.dart';

import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';


class Application extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    AppState.getReducer,
    initialState: AppState.initial(),
    middleware: [
      EpicMiddleware(AppState.getAppEpic),
    ],
  );

   Application({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return
         StoreProvider<AppState>(
          store: store,
          child:
               MaterialApp(
                theme: ThemeData(
                ),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1.0,
                    ),
                    child: child!,
                  );
                },
                debugShowCheckedModeBanner: false,
                 navigatorKey: RouteHelper.instance.navigatorKey,
                 onGenerateRoute: RouteHelper.instance.onGenerateRoute,
                 initialRoute: AppRoutes.homePage,
                home:  const HomePage(),
              )

        );


  }
}
