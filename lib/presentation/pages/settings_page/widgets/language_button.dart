import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageButton extends StatefulWidget {
  final String image;
  final String name;
  late bool checkedValue;

  final void Function() onTap;

  LanguageButton({required this.image, required this.name, required this.onTap, required this.checkedValue, Key? key}) : super(key: key);

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155.0,
      height: 150.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 90.0,
            height: 50.0,
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: CheckboxListTile(
              title: Text(widget.name),
              value: widget.checkedValue,
              onChanged: (newValue) {
                widget.onTap();
                setState(() {
                  widget.checkedValue = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          )
        ],
      ),
    );
  }
}
