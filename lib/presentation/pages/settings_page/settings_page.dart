
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/pages/settings_page/sttings_page_vm.dart';
import 'package:news_paper/presentation/widgets/page_button.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/route_manager/models/about_us_page_data.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/store/application/app_state.dart';


 final List<DropdownMenuItem<String>> menuItems = [
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


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, SettingsPageVM>(
      converter: SettingsPageVM.init,
      distinct: true,
      builder: (context, vm) {
        return _Widget(
          vm: vm,
        );

      },
    );
  }
}
class _Widget extends StatefulWidget {
  final SettingsPageVM vm;
  const _Widget({required this.vm,Key? key}) : super(key: key);

  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<_Widget> {
  bool isSwitched = false;
  String dropdownValue = en;
  @override
  Widget build(BuildContext context) {
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
                        fontSize: 16.0 * widget.vm.getFontSize,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Switch(
                      activeColor: AppColors.marigold,
                      value: widget.vm.isLight,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          widget.vm.changeTheme(value);
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
                    widget.vm.changeLanguage(newValue!);
                    setState(() {
                      dropdownValue = newValue;
                    });

                  },
                  items: menuItems,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  AppLocalizations.of(context)!.cFontSize,
                  key: const Key(keyCFontSize),
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 16.0 * widget.vm.getFontSize,
                    color: widget.vm.isLight ? AppColors.white.withOpacity(0.8) : AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Slider(
                activeColor: AppColors.marigold,
                value: widget.vm.getFontSize * 100,
                max: 150,
                min: 50,
                divisions: 5,
                onChanged: (double value) {
                  setState(() {
                    widget.vm.changeFontSize(value / 100);
                  });
                },
              ),
              ButtonPage(
                rowIcon: CupertinoIcons.forward,
                rowText: AppLocalizations.of(context)!.aUs,
                fontSize: widget.vm.getFontSize,
                light: widget.vm.isLight,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.aboutUs,
                    arguments: AboutUsPageData(
                      fontSize: widget.vm.getFontSize,
                      isLight: widget.vm.isLight,
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
