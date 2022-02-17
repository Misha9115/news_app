import 'package:flutter/material.dart';
import 'package:news_paper/presentation/pages/fav_page/fav_page.dart';

import 'package:news_paper/presentation/pages/home_page/home_page.dart';
import 'package:news_paper/presentation/pages/news_page/news_page.dart';
import 'package:news_paper/res/app_routes.dart';
import 'package:news_paper/route_helper/models/news_page_data.dart';

class RouteHelper {
  static final RouteHelper _instance = RouteHelper._();

  static RouteHelper get instance => _instance;

  late final GlobalKey<NavigatorState> navigatorKey;

  RouteHelper._() : navigatorKey = GlobalKey();

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
