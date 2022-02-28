import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/dictionary/data/en.dart';
import 'package:news_paper/dictionary/dictionary_classes/home_page_language.dart';
import 'package:news_paper/dictionary/flutter_dictionary.dart';
import 'package:news_paper/presentation/layouts/main_layouts.dart';
import 'package:news_paper/presentation/pages/fav_page/fav_page_vm.dart';
import 'package:news_paper/presentation/widgets/news_card.dart';
import 'package:news_paper/presentation/widgets/silver_grid_delegate.dart';
import 'package:news_paper/res/app_routes.dart';
import 'package:news_paper/route_helper/models/news_page_data.dart';
import 'package:news_paper/store/application/app_state.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  final ScrollController _singleChildScroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  double offset = 0.0;

  HomePageLanguage language = FlutterDictionary.instance.language?.homePageLanguage ?? en.homePageLanguage;

  @override
  void dispose() {
    _singleChildScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FavPageVM>(
      converter: FavPageVM.init,
      builder: (context, vm) {
        return MainLayout(
          body: loadingBooks(vm),
          selectedIndex: 1,
          title: language.fTitle,
        );
      },
    );
  }

  Widget loadingBooks(FavPageVM vm) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (scroll) {
        return false;
      },
      child: SingleChildScrollView(
        controller: _singleChildScroll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
              child: CustomScrollView(
                shrinkWrap: true,
                controller: _scrollController,
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, index) {
                        return SizedBox(
                            width: 106.0,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.newsPage,
                                  arguments: NewsPageData(
                                    news: vm.articlesDto[index],
                                  ),
                                );
                              },
                              child: NewsCard(
                                link: vm.articlesDto[index].urlToImage!,
                                titleNews: vm.articlesDto[index].title!,
                              ),
                            ));
                      },
                      childCount: vm.articlesDto.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6.0,
                      itemHeight: 170.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
