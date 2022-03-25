import 'package:flutter/material.dart';
import 'package:news_paper/res/app_colors.dart';

class AppGradient {
  static LinearGradient get globalButtonGradient {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.wheat,
        AppColors.marigold,
      ],
    );
  }
}
