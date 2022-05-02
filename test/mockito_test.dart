import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_paper/domain/service/analitics_service.dart';
import 'package:news_paper/domain/service/network_service/network_service.dart';
import 'package:news_paper/domain/service/validator.dart';
import 'package:news_paper/network/news_dao.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/shared/init.dart';
import 'package:news_paper/shared/locator.dart';

import 'mockito_test.mocks.dart';

@GenerateMocks([AnalyticService, NewsDao, InitApp, CustomLocator,NetworkService])
void main() {
  var analyticService = MockAnalyticService();
  var networkService = NetworkService.instance;
  var initApp = InitApp();
  var customLocator = CustomLocator();

  test('AnalyticServiceTest', () {
    when(analyticService.deleteToFav(link: 'ffff', userID: 'userId'));

    analyticService.deleteToFav(link: 'ffff', userID: 'userId');

    verify(analyticService.deleteToFav(link: 'ffff', userID: 'userId'));


    analyticService.addToFav(link: 'ffff', userID: 'userId');

    verify(analyticService.addToFav(link: 'ffff', userID: 'userId'));


    analyticService.loginFinish(userID: 'userId');

    verify(analyticService.loginFinish(userID: 'userId'));


    analyticService.loginWithGoogle(userID: 'userId');

    verify(analyticService.loginWithGoogle(userID: 'userId'));


    analyticService.changePage(pageName: AppRoutes.settingsPage);

    verify(analyticService.changePage(pageName: AppRoutes.settingsPage));


    analyticService.registrationFinish(userID: 'userId');

    verify(analyticService.registrationFinish(userID: 'userId'));


    analyticService.searchNews(userID: 'userId', searchRequest: 'request');

    verify(analyticService.searchNews(userID: 'userId', searchRequest: 'request'));

    networkService.dio.httpClientAdapter;
  });
  test('NetworkServiceTest', () {


    networkService.dio.httpClientAdapter;



  });
  test('CustomLocatorServiceTest', () {
    when(customLocator);
      customLocator;


  });
  test('InitServiceTest', () {
    when( initApp);
    initApp;


  });
}

