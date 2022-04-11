import 'package:flutter/material.dart';
import 'package:news_paper/presentation/layouts/main_layouts_vm.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MainLayout extends StatefulWidget {
  int selectedIndex = 0;
  final String title;
  final Widget body;
  final bool appBar;
  final bool bottomNavigationBar;

  MainLayout({
    required this.selectedIndex,
    required this.title,
    required this.body,
    required this.appBar,
    required this.bottomNavigationBar,
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
        builder: (context, vm) {
          return Scaffold(
            backgroundColor: vm.lightTheme?AppColors.grey:AppColors.white,
            body: widget.body,
            appBar: widget.appBar
                ? AppBar(
              backgroundColor:vm.lightTheme? AppColors.grey:null,
                    title: Text(widget.title),
                  )
                : null,
            bottomNavigationBar: widget.bottomNavigationBar
                ? BottomNavigationBar(
                    items:  <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.home),
                       label:  AppLocalizations.of(context)!.home,
                        // label: 'Home',
                        backgroundColor:vm.lightTheme? AppColors.grey:AppColors.white,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.favorite),
                        label: AppLocalizations.of(context)!.fTitle,
                        backgroundColor: vm.lightTheme? AppColors.grey:AppColors.white,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.search),
                        label:  AppLocalizations.of(context)!.search,
                        backgroundColor: vm.lightTheme? AppColors.grey:AppColors.white,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.settings),
                        label:  AppLocalizations.of(context)!.sTitle,
                        backgroundColor:vm.lightTheme? AppColors.grey:AppColors.white,
                      ),
                    ],


                    showUnselectedLabels: true,
                    currentIndex: widget.selectedIndex,
                    selectedItemColor: Colors.amber[800],
                    onTap: _onItemTapped,
                    unselectedItemColor: Colors.grey,
                    unselectedLabelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                : const SizedBox(),
          );
        });
  }

  void _onItemTapped(int index) {
    if (widget.selectedIndex != index) {
      if (index == 0) {
        Navigator.of(context).pushNamed(AppRoutes.homePage);
      }
      if (index == 1) {
        Navigator.of(context).pushNamed(AppRoutes.favPage);
      }
      if (index == 2) {
        Navigator.of(context).pushNamed(AppRoutes.searchPage);
      }
      if (index == 3) {
        Navigator.of(context).pushNamed(AppRoutes.settingsPage);
      }
    }
    setState(() {
      widget.selectedIndex = index;
    });
  }
}
