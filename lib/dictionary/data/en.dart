import 'package:news_paper/dictionary/dictionary_classes/news_page_language.dart';
import 'package:news_paper/dictionary/dictionary_classes/home_page_language.dart';
import 'package:news_paper/dictionary/models/language.dart';

const Language en = Language(
  newsPageLanguage: NewsPageLanguage(
    read:"Read more..",
    title:  'Bitcoin',
  ),
  homePageLanguage: HomePageLanguage(
      load: "loading...",
      news: "News",
      lPage: "Last page",
      nPage: "Next page",
      fTitle: "Favorite"
  ),
);
