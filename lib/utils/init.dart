import 'package:news_paper/utils/locator.dart';

class InitApp {
  static Future<void> init() async {
    CustomLocator.initLocator();
  }
}
