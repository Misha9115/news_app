import 'package:flutter/material.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_styles.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final EdgeInsets margin;

  const GlobalButton({
    required this.text,
    required this.onTap,
    this.margin = const EdgeInsets.symmetric(horizontal: 22.0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56.0,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: AppShadows.shadowsFile(AppColors.core),
          gradient: AppGradient.globalButtonGradient,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: AppFonts.globalButton,
          ),
        ),
      ),
    );
  }
}
