import 'package:flutter/material.dart';
import 'package:news_paper/res/app_colors.dart';

class AppFonts {
  static const TextStyle loadingText = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 17.0,
    height: 1.3,
    fontWeight: FontWeight.w400,
    color: AppColors.mainBlack,
  );

  static const TextStyle bottomBarTextStyle = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 10.0,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.mainTextColor,
  );
  static const TextStyle cardText = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle readMore = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 20.0,
    height: 1.3,
    fontWeight: FontWeight.w300,
    color: AppColors.blue,
  );

  static const TextStyle dataTime = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 20.0,
    height: 1.3,
    fontWeight: FontWeight.bold,
  );
}
