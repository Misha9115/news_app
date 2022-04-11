import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/layouts/main_layouts.dart';
import 'package:news_paper/presentation/pages/settings_page/sttings_page_vm.dart';
import 'package:news_paper/presentation/pages/settings_page/widgets/language_button.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/store/application/app_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;

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
                      'assets/moon.png',
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.5),
                      bottomLeft: Radius.circular(16.5),
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.dMode),
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
            Row(
              children: [
                LanguageButton(
                    checkedValue: vm.language == const Locale('en'),
                    name: 'English',
                    image: 'assets/eng.png',
                    onTap: () {
                      vm.changeLanguage('en');
                    }),
                LanguageButton(
                  checkedValue: vm.language == const Locale('de'),
                  image: 'assets/gr.jpg',
                  name: 'Germany',
                  onTap: () {
                    vm.changeLanguage('de');
                  },
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
