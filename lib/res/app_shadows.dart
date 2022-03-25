import 'package:flutter/material.dart';

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
}
