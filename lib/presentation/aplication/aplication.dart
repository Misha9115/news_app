import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/l10n/l10n.dart';
import 'package:news_paper/presentation/pages/home_page/home_page.dart';
import 'package:news_paper/route_manager/route_manager.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:overlay_support/overlay_support.dart';





class Application extends StatelessWidget {
  final Store<AppState> store;
  Application({required this.store, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: OverlaySupport(
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },

          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: child!,
            );
          },
          home: const HomePage(),
          navigatorKey: RouteManager.instance.navigatorKey,
          onGenerateRoute: RouteManager.instance.onGenerateRoute,
          initialRoute: AppRoutes.splashPage,
        ),
      ),
    );
  }
}

