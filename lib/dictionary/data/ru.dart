import 'package:news_paper/dictionary/dictionary_classes/news_page_language.dart';
import 'package:news_paper/dictionary/dictionary_classes/home_page_language.dart';
import 'package:news_paper/dictionary/models/language.dart';

const Language ru = Language(
  newsPageLanguage: NewsPageLanguage(
    read: "Читать больше",
    title: 'Биткоин',
  ),
  homePageLanguage: HomePageLanguage(
    load: "загрузка...",
    news: "Новости",
    lPage: "Пердидущая страница",
    nPage: "Следуйщая страница",
    fTitle: "Избранное",
  ),
);
