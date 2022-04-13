import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/pages/news_page/news_page_vm.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/store/application/app_state.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsPageVM>(
      converter: NewsPageVM.init,
      onInitialBuild: (NewsPageVM vm) {},
      builder: (context, vm) {
        return Scaffold(
          backgroundColor: vm.light ? AppColors.grey : AppColors.white,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.aUs,
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: 20.0 * vm.fontSize,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            backgroundColor: vm.light ? AppColors.grey : null,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.nApp,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 20.0 * vm.fontSize,
                      fontWeight: FontWeight.w700,
                      color: vm.light ? AppColors.white.withOpacity(0.8) : AppColors.black,
                    ),
                    maxLines: 3,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset(logo),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: vm.light ? AppColors.grey : AppColors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        lorText,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 10.0 * vm.fontSize,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            color: vm.light ? AppColors.white.withOpacity(0.8) : AppColors.black),
                      ),
                      Text(
                        lorText,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 10.0 * vm.fontSize,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            color: vm.light ? AppColors.white.withOpacity(0.8) : AppColors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    AppLocalizations.of(context)!.wAw,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 20.0 * vm.fontSize,
                      fontWeight: FontWeight.w700,
                      color: vm.light ? AppColors.white.withOpacity(0.8) : AppColors.black,
                    ),
                    maxLines: 3,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 100.0,
                      child: Image.asset(com),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5.0),
                      width: MediaQuery.of(context).size.width - 220,
                      child: Text(
                        lorText,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 10.0 * vm.fontSize,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.clip,
                            color: vm.light ? AppColors.white.withOpacity(0.8) : AppColors.black),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    AppLocalizations.of(context)!.wAwD,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 20.0 * vm.fontSize,
                      fontWeight: FontWeight.w700,
                      color: vm.light ? AppColors.white.withOpacity(0.8) : AppColors.black,
                    ),
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Image.asset(paper),
                ),
                Text(
                  lorText,
                  style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 10.0 * vm.fontSize,
                      height: 1.3,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.clip,
                      color: vm.light ? AppColors.white.withOpacity(0.8) : AppColors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
