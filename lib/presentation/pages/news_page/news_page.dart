import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:news_paper/dictionary/data/en.dart';
import 'package:news_paper/dictionary/dictionary_classes/news_page_language.dart';
import 'package:news_paper/dictionary/flutter_dictionary.dart';

import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/presentation/pages/news_page/news_page_vm.dart';
import 'package:news_paper/res/app_colors.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  final ArticlesDto news;

  const NewsPage({required this.news, Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsPageLanguage language = FlutterDictionary.instance.language?.newsPageLanguage ?? en.newsPageLanguage;
  //final NewsPageDictionary _dictionary = MainDictionary.instance.language.newsPageDictionary;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsPageVM>(
      converter: NewsPageVM.init,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title:  Text(  language.title.toString()),
          ),
          body: ListView(
            children: [
              Stack(children: [
                SizedBox(
                  height: 250,
                  child: Image.network(
                    widget.news.urlToImage!,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    color:  AppColors.mainColorDarkTwo,
                    child: Text(
                      DateFormat(dataTimeFormat).format(
                        DateTime.parse(widget.news.publishedAt!),
                      ),
                      style: AppFonts.dataTime,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: AppColors.mainColorDarkTwo,
                    child: Text(widget.news.author ?? emptyString),
                  ),
                ),
              ]),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            _chekFav(widget.news.url!, vm) ? vm.deleteFav(widget.news) : vm.addFav(widget.news);
                          },
                          child: Icon(
                            Icons.favorite,
                            color: _chekFav(widget.news.url!, vm) ? Colors.pink : Colors.grey,
                            size: 24.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL(widget.news.url);
                          },
                          child:   Text(
                            language.read,
                            style: AppFonts.readMore,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.news.title!,
                      style:  AppFonts.cardText,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(widget.news.description!)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  bool _chekFav(String url, NewsPageVM vm) {
    if (vm.articlesDto.isNotEmpty) {
      for (int i = 0; i < vm.articlesDto.length; i++) {
        if (url == vm.articlesDto[i].url) {
          return true;
        }
      }
    }
    return false;
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
