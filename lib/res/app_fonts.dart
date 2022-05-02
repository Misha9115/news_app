import 'package:flutter/material.dart';
import 'package:news_paper/res/app_styles.dart';

class AppFonts {
  static TextStyle bottomBarTextStyle = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 10.0 * size,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.mainTextColor,
  );
  static TextStyle bottomBarTextStyleNight = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 10.0 * size,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.white.withOpacity(0.8),
  );

  static TextStyle signButtonP = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 16.0 * size,
    color: AppColors.pinkishGrey,
    fontWeight: FontWeight.w400,
  );
  static TextStyle signButtonA = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 16.0 * size,
    color: AppColors.marigold,
    fontWeight: FontWeight.w500,
  );

  static TextStyle emptyFav = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 24.0 * size,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );
  static TextStyle buttonLogReg = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 16.0 * size,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static num size = 1;
}
