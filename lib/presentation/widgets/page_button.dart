import 'package:flutter/material.dart';
import 'package:news_paper/res/app_styles.dart';

class ButtonPage extends StatelessWidget {
  final void Function() onTap;
  final IconData rowIcon;
  final String rowText;
  final bool light;
  final double fontSize;

  const ButtonPage({
    required this.rowText,
    required this.rowIcon,
    required this.onTap,
    required this.light,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  fontSize: 20.0 * fontSize,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  color: light ? AppColors.white.withOpacity(0.8) : AppColors.black.withOpacity(0.8),
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
  }
}
