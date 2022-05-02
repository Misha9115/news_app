import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/presentation/pages/news_page/news_page_vm.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

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
      distinct: true,
      onInitialBuild: (NewsPageVM vm) {
        if (_chekFav(widget.news.url!, vm)) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      builder: (context, vm) {
        return Scaffold(
          backgroundColor: vm.isLight ? AppColors.grey : AppColors.white,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.title,
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: 20.0 * vm.fontSize,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            backgroundColor: vm.isLight ? AppColors.grey : null,
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 300.0,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: FadeInImage.assetNetwork(
                        placeholder: logo,
                        image: widget.news.urlToImage ?? imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(7.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                          color: AppColors.white.withOpacity(0.7),
                        ),
                        child: Text(
                          DateFormat(dataTimeFormat).format(
                            DateTime.parse(widget.news.publishedAt!),
                          ),
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 20.0 * vm.fontSize,
                            height: 1.3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 65.0, horizontal: 7.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                          color: AppColors.white.withOpacity(0.7),
                        ),
                        child: Text(widget.news.author ?? emptyString,
                            style: TextStyle(
                              fontFamily: fontFamily,
                              fontSize: 10.0 * vm.fontSize,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black.withOpacity(0.8),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 59.0,
                        decoration: BoxDecoration(
                          color: vm.isLight ? AppColors.grey : AppColors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                                              _animationController.reverse();
                                            } else {
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
                                        )),
                                InkWell(
                                  key: const Key(keySite),
                                  onTap: () => _launchURL(widget.news.url),
                                  child: Text(
                                    AppLocalizations.of(context)!.read,
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      fontSize: 20.0 * vm.fontSize,
                                      height: 1.3,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: vm.isLight ? AppColors.grey : AppColors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Text(
                      widget.news.title!,
                      style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 20.0 * vm.fontSize,
                        fontWeight: FontWeight.w700,
                        color: vm.isLight ? AppColors.white.withOpacity(0.8) : AppColors.black,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.news.description!,
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 17.0 * vm.fontSize,
                          height: 1.3,
                          fontWeight: FontWeight.w400,
                          color: vm.isLight ? AppColors.white.withOpacity(0.8) : AppColors.black),
                    )
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
