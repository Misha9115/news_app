import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/domain/service/analitics_service.dart';
import 'package:news_paper/presentation/layouts/main_layouts_vm.dart';
import 'package:news_paper/presentation/pages/fav_page/fav_page.dart';
import 'package:news_paper/presentation/pages/home_page/home_page.dart';
import 'package:news_paper/presentation/pages/search_page/search_page.dart';
import 'package:news_paper/presentation/pages/settings_page/settings_page.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/shared/locator.dart';
import 'package:news_paper/store/application/app_state.dart';

int selectedIndex = 0;
String title = emptyString;
bool isAppBar = false;

class MainLayout extends StatefulWidget {
  const MainLayout({
    Key? key,
  }) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainLayoutsVM>(
      converter: MainLayoutsVM.init,
      distinct: true,
      builder: (context, vm) {
        return Scaffold(
          backgroundColor: vm.isLight ? AppColors.grey : AppColors.white,
          body: Column(
            children: <Widget>[
              _stackedContainers(selectedIndex),
            ],
          ),
          appBar: isAppBar
              ? AppBar(
                  backgroundColor: vm.isLight ? AppColors.grey : null,
                  title: Text(
                    title,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 20.0 * vm.fontSize,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                )
              : null,
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.home,
                backgroundColor: vm.isLight ? AppColors.grey : AppColors.white,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: AppLocalizations.of(context)!.fTitle,
                backgroundColor: vm.isLight ? AppColors.grey : AppColors.white,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: AppLocalizations.of(context)!.search,
                backgroundColor: vm.isLight ? AppColors.grey : AppColors.white,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.sTitle,
                backgroundColor: vm.isLight ? AppColors.grey : AppColors.white,
              ),
            ],
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
            selectedFontSize: 13.0 * vm.fontSize,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
              fontSize: 13.0 * vm.fontSize,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    if (selectedIndex != index) {
      final AnalyticService _analyticsService = getIt<AnalyticService>();
      if (index != 0) {
        isAppBar = true;
        if (index == 1) {
          title = AppLocalizations.of(context)!.fTitle;
          _analyticsService.changePage(pageName: AppRoutes.favPage);
        }
        if (index == 2) {
          title = AppLocalizations.of(context)!.news;
          _analyticsService.changePage(pageName: AppRoutes.searchPage);
        }
        if (index == 3) {
          title = AppLocalizations.of(context)!.sTitle;
          _analyticsService.changePage(pageName:  AppRoutes.settingsPage);
        }
      } else {
        title = emptyString;
        isAppBar = false;
        _analyticsService.changePage(pageName: AppRoutes.homePage);
      }
      setState(() => selectedIndex = index);


    }
  }
}

Widget _stackedContainers(selectedIndex) {
  return Expanded(
    child: IndexedStack(
      index: selectedIndex,
      children: const <Widget>[
        HomePage(),
        FavPage(),
        SearchPage(),
        SettingsPage(),
      ],
    ),
  );
}
