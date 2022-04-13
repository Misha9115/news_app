import 'package:firebase_core/firebase_core.dart';
import 'package:news_paper/shared/locator.dart';

class InitApp {
  static Future<void> init() async {
    CustomLocator.initLocator();
    Firebase.initializeApp();
  }
}
