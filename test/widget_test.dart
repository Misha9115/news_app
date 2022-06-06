// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/l10n/l10n.dart';
import 'package:news_paper/presentation/pages/home_page/home_page.dart';
import 'package:news_paper/presentation/pages/login_page/login_page.dart';
import 'package:news_paper/presentation/widgets/global_button.dart';
import 'package:news_paper/presentation/widgets/login_button.dart';
import 'package:news_paper/presentation/pages/news_page/news_page.dart';
import 'package:news_paper/presentation/pages/search_page/search_page.dart';
import 'package:news_paper/presentation/pages/about_us/about_us.dart';
import 'package:news_paper/presentation/pages/settings_page/settings_page.dart';
import 'package:news_paper/presentation/widgets/page_button.dart';
import 'package:news_paper/presentation/widgets/custom_text_field.dart';
import 'package:news_paper/presentation/widgets/news_card.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/route_manager/route_manager.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/shared/init.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

final Store<AppState> store = Store<AppState>(
  AppState.getReducer,
  initialState: AppState.initial(),
  middleware: [
    EpicMiddleware(AppState.getAppEpic),
  ],
);

void main() {
  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      const NewsCard(
          fontSize: 1,
          light: true,
          titleNews: 'News',
          link:
              'https://i.guim.co.uk/img/media/6a37527c1d124bb06f75f81e34fec153cf7145b1/0_0_4000_2400/master/4000.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctZGVmYXVsdC5wbmc&enable=upscale&s=9c45c05ee1d6ee2e6e4f77ecf928b637'),
    );
    var image = find.byType(FadeInImage);
    expect(image, findsOneWidget);

    print('Image Work');
    final titleFinder = find.text('News');
    expect(titleFinder, findsOneWidget);
    print('Image Work');
  });

  testWidgets("Button Page Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonPage(
            rowText: 'xtx',
            fontSize: 1,
            light: true,
            rowIcon: CupertinoIcons.forward,
            onTap: () {},
          ),
        ),
      ),
    );
    final titleFinder = find.text('xtx');
    expect(titleFinder, findsOneWidget);

    print('Button');
  });
  //GlobalButton
  testWidgets("Global Button Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GlobalButton(
            text: 'xtx',
            fontSize: 1,
            onTap: () {},
          ),
        ),
      ),
    );
    final titleFinder = find.text('xtx');
    expect(titleFinder, findsOneWidget);

    print('Global Button');
  });

  testWidgets("Login Button Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginButton(
            function: () {},
            hintTextStyle: AppFonts.buttonLogReg,
            image: googleLogo,
            padding: 20.0,
            onTap: true,
            textR: 'singUp',
            textS: 'singIn',
          ),
        ),
      ),
    );
    final titleFinder = find.text('singIn');
    expect(titleFinder, findsOneWidget);

    print('Login Button');
  });
  testWidgets("Text Field Test", (WidgetTester tester) async {
    final TextEditingController _passwordController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            keyValue: 'keyLoginTest',
            controller: _passwordController,
          ),
        ),
      ),
    );

    var textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Flutter Devs');
    expect(find.text('Flutter Devs'), findsOneWidget);
    print('Text Field');
  });
  testWidgets("Search Page Test", (WidgetTester tester) async {
    final Store<AppState> store = Store<AppState>(
      AppState.getReducer,
      initialState: AppState.initial(),
      middleware: [
        EpicMiddleware(AppState.getAppEpic),
      ],
    );
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) => store.state,
            builder: (BuildContext context, AppState state) {
              return OverlaySupport(
                child: MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: L10n.all,
                  locale: store.state.languageState.language,
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
                  home: const SearchPage(),
                  navigatorKey: RouteManager.instance.navigatorKey,
                  onGenerateRoute: RouteManager.instance.onGenerateRoute,
                  initialRoute: AppRoutes.searchPage,
                ),
              );
            }),
      ),
    );
    var textField = find.byType(CustomTextField);

    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Work');
    await tester.pump();
  });
  testWidgets("Login Page Test", (WidgetTester tester) async {
    final Store<AppState> store = Store<AppState>(
      AppState.getReducer,
      initialState: AppState.initial(),
      middleware: [
        EpicMiddleware(AppState.getAppEpic),
      ],
    );
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) => store.state,
            builder: (BuildContext context, AppState state) {
              return OverlaySupport(
                child: MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: L10n.all,
                  locale: store.state.languageState.language,
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
                  home: const LoginPage(),
                  navigatorKey: RouteManager.instance.navigatorKey,
                  onGenerateRoute: RouteManager.instance.onGenerateRoute,
                  initialRoute: AppRoutes.loginPage,
                ),
              );
            }),
      ),
    );
    var loginButton = find.byType(LoginButton);
    expect(loginButton, findsOneWidget);
    var globalButton = find.byType(GlobalButton);
    expect(globalButton, findsWidgets);
    var textField = find.byType(CustomTextField);
    expect(textField, findsWidgets);
    print('Login page');
  });

  testWidgets("Settings Page Test", (WidgetTester tester) async {
    final Store<AppState> store = Store<AppState>(
      AppState.getReducer,
      initialState: AppState.initial(),
      middleware: [
        EpicMiddleware(AppState.getAppEpic),
      ],
    );
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) => store.state,
            builder: (BuildContext context, AppState state) {
              return OverlaySupport(
                child: MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: L10n.all,
                  locale: store.state.languageState.language,
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
                  home: const SettingsPage(),
                  navigatorKey: RouteManager.instance.navigatorKey,
                  onGenerateRoute: RouteManager.instance.onGenerateRoute,
                  initialRoute: AppRoutes.settingsPage,
                ),
              );
            }),
      ),
    );
    var loginButton = find.byType(Switch);
    expect(loginButton, findsOneWidget);
  });
  testWidgets(" AboutUs Test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: store.state.languageState.language,
      home:  AboutUs(
       fontSize: 1,
       isLight: true,
      ),
    ));
  });

  //NewsPage

  testWidgets(" News Page Test", (WidgetTester tester) async {
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) => store.state,
            builder: (BuildContext context, AppState state) {
              return OverlaySupport(
                child: MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: L10n.all,
                  locale: store.state.languageState.language,
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
                  home: NewsPage(
                    news: ArticlesDto(
                        urlToImage: imageURL,
                        content: '',
                        description: '',
                        title: '',
                        publishedAt: DateTime.now().toString(),
                        url: imageURL,
                        author: ''),
                  ),
                ),
              );
            }),
      ),
    );
  });
  testWidgets("Home Page Test", (WidgetTester tester) async {
    await InitApp.init();
    final Store<AppState> store = Store<AppState>(
      AppState.getReducer,
      initialState: AppState.initial(),
      middleware: [
        EpicMiddleware(AppState.getAppEpic),
      ],
    );
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) => store.state,
            builder: (BuildContext context, AppState state) {
              return OverlaySupport(
                child: MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: L10n.all,
                  locale: store.state.languageState.language,
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
                  initialRoute: AppRoutes.homePage,
                ),
              );
            }),
      ),
    );
    tester.pumpAndSettle();
  });
}
