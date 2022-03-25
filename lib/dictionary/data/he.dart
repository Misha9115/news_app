

import 'package:news_paper/dictionary/dictionary_classes/login_page_language.dart';
import 'package:news_paper/dictionary/dictionary_classes/news_page_language.dart';
import 'package:news_paper/dictionary/dictionary_classes/home_page_language.dart';
import 'package:news_paper/dictionary/models/language.dart';

const Language he = Language(
  newsPageLanguage: NewsPageLanguage(
    read:"ביטקוין",
    title:  'ביטקוין',
  ),
  homePageLanguage: HomePageLanguage(
      load: "טוען...",
      news: "חדשות",
      lPage: "דף אחרון",
      nPage: "העמוד הבא",
      fTitle: "מועדף"
  ),
  loginPageLanguage: LoginPageLanguage(
    login: 'התחברות',
    password: 'סיסמה',
    singIn: 'להתחבר',
    singUp: 'לשיר למעלה',
    cPassword: 'אשר סיסמה',
  ),
);
