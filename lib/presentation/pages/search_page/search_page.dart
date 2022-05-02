import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/pages/search_page/search_page_vm.dart';
import 'package:news_paper/presentation/widgets/custom_text_field.dart';
import 'package:news_paper/presentation/widgets/news_card.dart';
import 'package:news_paper/presentation/widgets/silver_grid_delegate.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/route_manager/models/news_page_data.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/store/application/app_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SearchPageVM>(
      converter: SearchPageVM.init,
      distinct: true,
      builder: (context, vm) {
        return _Widget(vm: vm);
      },
    );
  }
}

class _Widget extends StatefulWidget {
  final SearchPageVM vm;

  const _Widget({required this.vm, Key? key}) : super(key: key);

  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<_Widget> {
  final ScrollController _singleChildScroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _myTextController = TextEditingController();
  bool _paginationLoader = false;

  @override
  void dispose() {
    _singleChildScroll.dispose();
    _scrollController.dispose();
    _myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (scroll) {
        if (_singleChildScroll.position.pixels >= (_singleChildScroll.position.maxScrollExtent - 900)) {
          if (widget.vm.newsList.length < newsListLength) {
            if (!_paginationLoader) {
              widget.vm.pagination(widget.vm.newsList.length + paginationStep, _myTextController.text);
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
              key: const Key(keySearchKey),
              onTap: () {
                widget.vm.getSearchNews(paginationStep, _myTextController.text);
              },
              child: Icon(
                Icons.search,
                size: 50,
                color: widget.vm.isLight ? AppColors.white : AppColors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
              child: widget.vm.newsList.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.load,
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 17.0 * widget.vm.fontSize,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            color: widget.vm.isLight ? AppColors.white.withOpacity(0.8) : AppColors.black,
                          ),
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
                                      arguments: NewsPageData(news: widget.vm.newsList[index]),
                                    );
                                  },
                                  child: NewsCard(
                                    link: widget.vm.newsList[index].urlToImage ?? imageURL,
                                    titleNews: widget.vm.newsList[index].title ?? emptyString,
                                    light: widget.vm.isLight,
                                    fontSize: widget.vm.fontSize,
                                  ),
                                ),
                              );
                            },
                            childCount: widget.vm.newsList.length,
                          ),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            itemHeight: 170.0,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: widget.vm.isPaginationLoading ? 50.0 : 0.0,
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
                  key: const Key(keyChangePageSearch),
                  onTap: () {
                    if (widget.vm.page > 1) {
                      widget.vm.changePage(widget.vm.page - 1, _myTextController.text);
                      widget.vm.changeNewsPage(widget.vm.page - 1);
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.lPage,
                    style: widget.vm.isLight ? AppFonts.bottomBarTextStyleNight : AppFonts.bottomBarTextStyle,
                  ),
                ),
                InkWell(
                  key: const Key(keyChangePageSearch2),
                  onTap: () {
                    widget.vm.changePage(widget.vm.page + 1, _myTextController.text);
                    widget.vm.changeNewsPage(widget.vm.page + 1);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.nPage,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 10.0 * widget.vm.fontSize,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                      color: widget.vm.isLight ? AppColors.white.withOpacity(0.8) : AppColors.mainTextColor,
                    ),
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
