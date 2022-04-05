import 'package:flutter/material.dart';
import 'package:news_paper/presentation/pages/fav_page/fav_page.dart';
import 'package:news_paper/presentation/pages/home_page/home_page.dart';
import 'package:news_paper/presentation/pages/login_page/login_page.dart';
import 'package:news_paper/presentation/pages/news_page/news_page.dart';
import 'package:news_paper/presentation/pages/search_page/search_page.dart';
import 'package:news_paper/presentation/pages/splash_page/splash_page.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/route_manager/models/news_page_data.dart';

class RouteManager {
  static final RouteManager _instance = RouteManager._();

  static RouteManager get instance => _instance;

  late final GlobalKey<NavigatorState> navigatorKey;

  RouteManager._() : navigatorKey = GlobalKey();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return _defaultRoute(
          settings: settings,
          page: const HomePage(),
        );
      case AppRoutes.newsPage:
        return _defaultRoute(
          settings: settings,
          page: NewsPage(
            news: (settings.arguments as NewsPageData).news,
          ),
        );
      case AppRoutes.favPage:
        return _defaultRoute(
          settings: settings,
          page: const FavPage(),
        );
      case AppRoutes.searchPage:
        return _defaultRoute(
          settings: settings,
          page: const SearchPage(),
        );
      case AppRoutes.loginPage:
        return _defaultRoute(
          settings: settings,
          page: const LoginPage(),
        );
      case AppRoutes.splashPage:
        return _defaultRoute(
          settings: settings,
          page: const SplashPage(),
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: const HomePage(),
        );
    }
  }

  static PageRoute _defaultRoute({
    required RouteSettings settings,
    required Widget page,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => page,
    );
  }
}
