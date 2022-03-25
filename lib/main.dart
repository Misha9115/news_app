import 'package:flutter/material.dart';
import 'package:news_paper/aplication/aplication.dart';
import 'package:news_paper/utils/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InitApp.init();

  runApp(
    Application(),
  );
}
