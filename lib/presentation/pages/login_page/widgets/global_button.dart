import 'package:flutter/material.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_styles.dart';

class GlobalButton extends StatefulWidget {
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
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){

        setState(() {
          selected = !selected;
        });
        Future.delayed(const Duration(milliseconds: 200), () {
         widget.onTap();
          setState(() {
            selected = !selected;
          });
        });
      },// onTap,
      child: AnimatedContainer(
        height: selected ? 40:47.0,
        margin: selected ?const EdgeInsets.symmetric(horizontal: 28.0): widget.margin,
        decoration: BoxDecoration(
          boxShadow: AppShadows.shadowsFile(AppColors.core),
          gradient: AppGradient.globalButtonGradient,
          borderRadius: BorderRadius.circular(10.0),
        ),
        duration:  const Duration(milliseconds: 200),
        child: Center(
          child: Text(
            widget.text,
            style: AppFonts.globalButton,
          ),
        ),
      ),
    );
  }
}
