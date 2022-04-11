import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color mainBlack = Color(0xFF2E2F34);
  static const Color mainColorDarkTwo = Color(0x666699FF);
  static const Color blue = Color(0xFF2192F0);
  static const Color mainTextColor = Color(0xFF2E2F34);
  static const Color backGround = Color(0xFFC7C7CC);
  static const Color border = Color(0xFF828282);
  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color pinkishGrey = Color(0xFFbdbdbd);
  static const Color marigold = Color(0xFFffbd00);
  static const Color grey = Color(0xFF494949);
  static const Color grey2 = Color.fromRGBO(137, 137, 137,1);
  static const Color grey3 =Color.fromARGB(100, 102, 102, 153);
  static const Color core = Color(0xFFc79300);
  static const Color wheat = Color(0xFFffde81);
}

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

class AppShadows {
  static List<BoxShadow> shadowsFile(Color color) {
    return [
      BoxShadow(
        offset: const Offset(-0.0, 25.0),
        color: color.withOpacity(0.6),
        spreadRadius: -20.0,
        blurRadius: 20.0,
      ),
    ];
  }
  static List<BoxShadow> shadowsTextField(Color color) {
    return [
      BoxShadow(
        offset: const Offset(0.0, 3.0),
        color: color.withOpacity(0.8),
        spreadRadius: -1.0,
        blurRadius: 4.0,
      ),
    ];
  }
}
