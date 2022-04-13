import 'package:flutter/material.dart';
import 'package:news_paper/res/app_styles.dart';

class AppFonts {
  static TextStyle loadingText = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 17.0 * size,
    height: 1.3,
    fontWeight: FontWeight.w400,
    color: AppColors.mainBlack,
  );
  static TextStyle loadingTextNight = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 17.0 * size,
    height: 1.3,
    fontWeight: FontWeight.w400,
    color: AppColors.white.withOpacity(0.8),
  );

  static TextStyle globalButton = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 24.0 * size,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

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
  static TextStyle cardText = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 20.0 * size,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static TextStyle cardTextNight = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 20.0 * size,
    fontWeight: FontWeight.w700,
    color: AppColors.white.withOpacity(0.8),
  );

  static TextStyle readMore = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 20.0 * size,
    height: 1.3,
    fontWeight: FontWeight.w300,
    color: AppColors.blue,
  );

  static TextStyle dataTime = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 20.0 * size,
    height: 1.3,
    fontWeight: FontWeight.bold,
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
