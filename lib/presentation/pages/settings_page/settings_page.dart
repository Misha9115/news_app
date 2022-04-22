
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/layouts/main_layouts.dart';
import 'package:news_paper/presentation/pages/settings_page/sttings_page_vm.dart';
import 'package:news_paper/presentation/pages/settings_page/widgets/page_button.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/route_manager/models/about_us_page_data.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/store/application/app_state.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            english,
          ),
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: Image.asset(eng),
          )
        ],
      ),
      value: en,
    ),
    DropdownMenuItem(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text(germany),
        SizedBox(
          height: 30.0,
          width: 30.0,
          child: Image.asset(gr),
        ),
      ]),
      value: de,
    ),
  ];
  return menuItems;
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  String dropdownValue = en;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsPageVM>(
      converter: SettingsPageVM.init,
      builder: (context, vm) {
        return MainLayout(
          bottomNavigationBar: true,
          appBar: true,
          body: loadingBooks(vm),
          selectedIndex: 3,
          title: AppLocalizations.of(context)!.sTitle,
        );
      },
    );
  }

  Widget loadingBooks(SettingsPageVM vm) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (scroll) {
        return false;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                height: 60.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: AppColors.black.withOpacity(0.8),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        moon,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.5),
                        bottomLeft: Radius.circular(16.5),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.dMode,
                      style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 16.0 * vm.getFontSize,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Switch(
                      activeColor: AppColors.marigold,
                      value: vm.lightTheme,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          vm.changeTheme(value);
                        });
                      },
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  key: const Key(keyDropdownButton),
                  menuMaxHeight: MediaQuery.of(context).size.height,
                  value: dropdownValue,

                  onChanged: (String? newValue) {
                    vm.changeLanguage(newValue!);
                    setState(() {
                      dropdownValue = newValue;
                    });

                  },
                  items: dropdownItems,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  AppLocalizations.of(context)!.cFontSize,
                  key: const Key(keyCFontSize),
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 16.0 * vm.getFontSize,
                    color: vm.lightTheme ? AppColors.white.withOpacity(0.8) : AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Slider(
                activeColor: AppColors.marigold,
                value: vm.getFontSize * 100,
                max: 150,
                min: 50,
                divisions: 5,
                onChanged: (double value) {
                  setState(() {
                    vm.changeFontSize(value / 100);
                  });
                },
              ),
              ButtonPage(
                rowIcon: CupertinoIcons.forward,
                rowText: AppLocalizations.of(context)!.aUs,
                fontSize: vm.getFontSize,
                light: vm.lightTheme,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.aboutUs,
                    arguments: AboutUsPageData(
                      fontSize: vm.getFontSize,
                      light: vm.lightTheme,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
