import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/pages/settings_page/sttings_page_vm.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/store/application/app_state.dart';

class ButtonPage extends StatelessWidget {
  final void Function() onTap;
  final IconData rowIcon;
  final String rowText;

  const ButtonPage({
    required this.rowText,
    required this.rowIcon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsPageVM>(
        converter: SettingsPageVM.init,
        builder: (context, vm) {
          return InkWell(
            splashColor: Colors.transparent,
            onTap: onTap,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      rowText,
                      style: TextStyle(
                        fontFamily: 'SFProText',
                        fontSize: 20.0 * vm.getFontSize,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color: vm.lightTheme ? AppColors.white.withOpacity(0.8) : AppColors.black.withOpacity(0.8),
                      ),
                    ),
                    Icon(
                      rowIcon,
                      color: AppColors.marigold,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 1.0,
                  color: AppColors.black.withOpacity(0.5),
                ),
              ],
            ),
          );
        });
  }
}
