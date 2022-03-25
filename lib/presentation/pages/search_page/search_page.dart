import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/dictionary/data/en.dart';
import 'package:news_paper/dictionary/dictionary_classes/home_page_language.dart';
import 'package:news_paper/dictionary/flutter_dictionary.dart';
import 'package:news_paper/presentation/layouts/main_layouts.dart';
import 'package:news_paper/presentation/pages/search_page/search_page_vm.dart';
import 'package:news_paper/presentation/widgets/custom_text_field.dart';
import 'package:news_paper/presentation/widgets/news_card.dart';
import 'package:news_paper/presentation/widgets/silver_grid_delegate.dart';
import 'package:news_paper/res/app_colors.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_routes.dart';
import 'package:news_paper/route_helper/models/news_page_data.dart';
import 'package:news_paper/store/application/app_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  HomePageLanguage language = FlutterDictionary.instance.language?.homePageLanguage ?? en.homePageLanguage;

  final ScrollController _singleChildScroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _myTextController = TextEditingController();
  double offset = 0.0;
  bool _paginationLoader = false;

  @override
  void dispose() {
    _singleChildScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SearchPageVM>(
      converter: SearchPageVM.init,
      builder: (context, vm) {
        return MainLayout(
          bottomNavigationBar: true,
          appBar: true,
          body: loadingBooks(vm),
          selectedIndex: 2,
          title: language.news,
        );
      },
    );
  }

  Widget loadingBooks(SearchPageVM vm) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (scroll) {
        if (_singleChildScroll.position.pixels >= (_singleChildScroll.position.maxScrollExtent - 900)) {
          if (vm.newsList.length < 81) {
            if (!_paginationLoader) {
              vm.pagination(vm.newsList.length + 20, _myTextController.text);
              _paginationLoader = true;
            }
          }
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: _singleChildScroll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10.0),
            AppTextField(
              controller: _myTextController,
              keyValue: key,
            ),
            InkWell(
              onTap: () {
                vm.getSearchNews(20, _myTextController.text);
              },
              child: const Icon(
                Icons.search,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
              child: vm.newsList.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Text(
                          language.load,
                          style: AppFonts.loadingText,
                        ),
                      ),
                    )
                  : CustomScrollView(
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
                                      arguments: NewsPageData(news: vm.newsList[index]),
                                    );
                                  },
                                  child: NewsCard(
                                    link: vm.newsList[index].urlToImage ?? imageURL,
                                    titleNews: vm.newsList[index].title ?? '',
                                  ),
                                ),
                              );
                            },
                            childCount: vm.newsList.length,
                          ),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            itemHeight: 170.0,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: vm.paginationLoader ? 50.0 : 0.0,
                            color: Colors.transparent,
                            child: const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    if (vm.page > 1) {
                      vm.changePage(vm.page - 1, _myTextController.text);
                      vm.changeNewsPage(vm.page - 1);
                    }
                  },
                  child: Text(
                    language.lPage,
                    style: AppFonts.bottomBarTextStyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    vm.changePage(vm.page + 1, _myTextController.text);
                    vm.changeNewsPage(vm.page + 1);
                  },
                  child: Text(
                    language.nPage,
                    style: AppFonts.bottomBarTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
