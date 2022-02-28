import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/dictionary/data/en.dart';
import 'package:news_paper/dictionary/dictionary_classes/home_page_language.dart';
import 'package:news_paper/dictionary/flutter_dictionary.dart';
import 'package:news_paper/presentation/layouts/main_layouts.dart';
import 'package:news_paper/presentation/pages/home_page/home_page_vm.dart';
import 'package:news_paper/presentation/widgets/news_card.dart';
import 'package:news_paper/presentation/widgets/silver_grid_delegate.dart';
import 'package:news_paper/res/app_colors.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_routes.dart';
import 'package:news_paper/route_helper/models/news_page_data.dart';
import 'package:news_paper/store/application/app_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageLanguage language = FlutterDictionary.instance.language?.homePageLanguage ?? en.homePageLanguage;

  final ScrollController _singleChildScroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  double offset = 0.0;
  bool _paginationLoader = false;

  @override
  @override
  void dispose() {
    _singleChildScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVM>(
      converter: HomePageVM.init,
      onInitialBuild: (vm) {
        if (vm.newsList.articles!.isEmpty) {
          vm.getBooks();
        }
      },
      builder: (context, vm) {
        return MainLayout(
          body: vm.newsList.articles!.isEmpty
              ? Center(
                  child: Text(
                    language.load,
                    style: AppFonts.loadingText,
                  ),
                )
              : loadingBooks(vm),
          selectedIndex: 0,
          title: language.news,
        );
      },
    );
  }

  Widget loadingBooks(HomePageVM vm) {
    if (!vm.paginationLoader) {
      _paginationLoader = false;
    }
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (scroll) {
        if (_singleChildScroll.position.pixels >= (_singleChildScroll.position.maxScrollExtent - 900)) {
          if (vm.newsList.articles!.length < 81) {
            if (!_paginationLoader) {
              vm.getPagination(vm.newsList.articles!.length + 20);
              _paginationLoader = true;
            }
          }
        }
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
                                  news: vm.newsList.articles![index],
                                ),
                              );
                            },
                            child: NewsCard(
                              link: vm.newsList.articles![index].urlToImage!,
                              titleNews: vm.newsList.articles![index].title!,
                            ),
                          ),
                        );
                      },
                      childCount: vm.newsList.articles!.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                      crossAxisCount: 3,
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
                      vm.changePage(vm.page - 1);
                    }
                  },
                  child: Text(
                    language.lPage,
                    style: AppFonts.bottomBarTextStyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    vm.changePage(vm.page + 1);
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