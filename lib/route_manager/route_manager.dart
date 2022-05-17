import 'package:flutter/material.dart';
import 'package:news_paper/domain/service/analitics_service.dart';
import 'package:news_paper/presentation/layouts/main_layouts.dart';
import 'package:news_paper/presentation/pages/login_page/login_page.dart';
import 'package:news_paper/presentation/pages/news_page/news_page.dart';
import 'package:news_paper/presentation/pages/about_us/about_us.dart';
import 'package:news_paper/presentation/pages/splash_page/splash_page.dart';
import 'package:news_paper/presentation/pages/support_page/support_page.dart';
import 'package:news_paper/route_manager/models/about_us_page_data.dart';
import 'package:news_paper/route_manager/models/news_page_data.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/shared/locator.dart';

class RouteManager {
  static final RouteManager _instance = RouteManager._();

  static RouteManager get instance => _instance;

  late final GlobalKey<NavigatorState> navigatorKey;

  RouteManager._() : navigatorKey = GlobalKey();
  final AnalyticService _analyticsService = getIt<AnalyticService>();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return _defaultRoute(
          settings: settings,
          page:  const MainLayout(),
        );
      case AppRoutes.newsPage:
        _analyticsService.changePage(pageName: AppRoutes.newsPage);
        return _defaultRoute(
          settings: settings,
          page: NewsPage(
            news: (settings.arguments as NewsPageData).news,
          ),
        );
      case AppRoutes.loginPage:
        _analyticsService.changePage(pageName: AppRoutes.loginPage);
        return _defaultRoute(
          settings: settings,
          page: const LoginPage(),
        );
      case AppRoutes.splashPage:
        _analyticsService.changePage(pageName: AppRoutes.splashPage);
        return _defaultRoute(
          settings: settings,
          page: const SplashPage(),
        );

      case AppRoutes.supportPage:
        _analyticsService.changePage(pageName: AppRoutes.splashPage);
        return _defaultRoute(
          settings: settings,
          page:  SupportPage(
            fontSize: (settings.arguments as AboutUsPageData).fontSize,
            isLight:  (settings.arguments as AboutUsPageData).isLight,
          ),
        );
      case AppRoutes.aboutUs:
        _analyticsService.changePage(pageName: AppRoutes.aboutUs);
        return _defaultRoute(
          settings: settings,
          page:  AboutUs(
            fontSize: (settings.arguments as AboutUsPageData).fontSize,
            isLight:  (settings.arguments as AboutUsPageData).isLight,
          ),
        );
      default:
        return _defaultRoute(
          settings: settings,
          page:  const MainLayout(),
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
