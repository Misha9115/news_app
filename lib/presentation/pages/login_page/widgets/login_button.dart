import 'package:flutter/material.dart';
import 'package:news_paper/res/app_styles.dart';

class LoginButton extends StatelessWidget {
  final bool onTap;
  final String textS;
  final String textR;
  final double padding;
  final String image;
  final TextStyle hintTextStyle;
  final void Function() function;

  const LoginButton({
    required this.hintTextStyle,
    required this.function,
    required this.image,
    required this.padding,
    required this.textR,
    required this.textS,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: InkWell(
        onTap: function,
        child: Container(
          height: 42.0,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: AppShadows.shadowsTextField(
              AppColors.black.withOpacity(0.8),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(-0.65, 0.0),
                child: SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: Image.asset(image),
                ),
              ),
              Align(
                alignment: const Alignment(0.2, 0.0),
                child: Text(
                  onTap ? textS : textR,
                  style: hintTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
