import 'package:flutter/material.dart';
import 'package:news_paper/res/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String keyValue;
  final void Function(String)? onSubmitted;
  final void Function(String)? validator;
  final String? labelText;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextInputType? inputType;
  final FocusNode? focusNode;
  final TextEditingController controller;

  AppTextField({
    required this.keyValue,
    required this.controller,
    this.focusNode,
    this.textStyle,
    this.onSubmitted,
    this.labelText,
    this.hintText,
    this.hintTextStyle,
    this.inputType = TextInputType.number,
    this.validator,
  }) : super(key: Key(keyValue));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          const SizedBox(
            height: 50.0,
            width: double.infinity,

          ),
          Container(
            alignment: Alignment.center,
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: AppColors.border.withOpacity(0.08),
              border: Border.all(
                color: AppColors.border.withOpacity(0.1),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              key: Key(keyValue),
              focusNode: focusNode,
              controller: controller,
              // keyboardType: inputType,
              cursorColor: AppColors.red.withOpacity(0.1),//CustomTheme.colors.primaryColor,
              style: textStyle,
              onChanged: validator,
              onFieldSubmitted: onSubmitted,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                alignLabelWithHint: true,
                labelText: labelText,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: hintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
