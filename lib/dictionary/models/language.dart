import 'package:news_paper/dictionary/dictionary_classes/news_page_language.dart';
import 'package:news_paper/dictionary/dictionary_classes/home_page_language.dart';

class Language {
  final NewsPageLanguage newsPageLanguage;
  final HomePageLanguage homePageLanguage;

  const Language({
    required this.newsPageLanguage,
    required this.homePageLanguage,
  });
}
