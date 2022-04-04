import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/presentation/pages/news_page/news_page_vm.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsPage extends StatefulWidget {
  final ArticlesDto news;

  const NewsPage({required this.news, Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _colorTween = ColorTween(begin: Colors.grey, end: Colors.red).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsPageVM>(
      converter: NewsPageVM.init,
      onInitialBuild: (NewsPageVM vm) {
        if (_chekFav(widget.news.url!, vm)) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.title.toString()),
          ),
          body: ListView(
            children: [
              Stack(children: [
                SizedBox(
                  height: 250,
                  child: FadeInImage.assetNetwork(
                    placeholder: logo,
                    image: widget.news.urlToImage ?? imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    color: AppColors.mainColorDarkTwo,
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
                        AnimatedBuilder(
                            animation: _colorTween,
                            builder: (context, child) => InkWell(
                                  onTap: () {
                                    if (_animationController.status == AnimationStatus.completed) {
                                      print('1');
                                      _animationController.reverse();
                                    } else {
                                      print('2');
                                      _animationController.forward();
                                    }
                                    if (_chekFav(widget.news.url!, vm)) {
                                      vm.deleteFav(widget.news);
                                    } else {
                                      vm.addFav(widget.news);
                                      vm.saveToDataBase(widget.news);
                                    }
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: _colorTween.value,
                                    size: 24.0,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                )
                            ),
                        InkWell(
                          onTap: () {
                            _launchURL(widget.news.url);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.read,
                            style: AppFonts.readMore,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.news.title!,
                      style: AppFonts.cardText,
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
