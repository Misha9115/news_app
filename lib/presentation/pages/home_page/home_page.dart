// ignore_for_file: avoid_print



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/pages/home_page/home_page_vm.dart';
import 'package:news_paper/presentation/widgets/news_card.dart';
import 'package:news_paper/presentation/widgets/silver_grid_delegate.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/route_manager/models/news_page_data.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/store/application/app_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVM>(
      converter: HomePageVM.init,
      distinct: false,
      onInitialBuild: (vm) {
        if (vm.newsList.articles!.isEmpty) {
          vm.getNews();
        }
      },
      builder: (context, vm) {
        return  vm.newsList.articles!.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.load,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 17.0 * vm.fontSize,
                      height: 1.3,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainBlack,
                    ),
                  ),
                )
              : _Widget(vm: vm);

      },
    );
  }
}

class _Widget extends StatefulWidget {
  final HomePageVM vm;

  const _Widget({required this.vm, Key? key}) : super(key: key);

  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<_Widget> {
  final ScrollController _singleChildScroll = ScrollController();
  double offset = 0.0;
  bool _isPaginationLoading = false;

  @override
  void dispose() {
    _singleChildScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.vm.isPaginationLoading) {
      _isPaginationLoading = false;
    }

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (scroll) {
        if (_singleChildScroll.position.pixels >= (_singleChildScroll.position.maxScrollExtent - 900)) {
          if (widget.vm.newsList.articles!.length < newsListLength) {
            if (!_isPaginationLoading) {
              widget.vm.getPagination(widget.vm.newsList.articles!.length + paginationStep);
              _isPaginationLoading = true;
            }
          }
        }
        return false;
      },
      child: CustomScrollView(
        controller: _singleChildScroll,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColors.grey3,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                AppLocalizations.of(context)!.lNews,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 17 * widget.vm.fontSize,
                ),
              ),
              background: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  news,
                  fit: BoxFit.cover,
                  color: widget.vm.isLight ? AppColors.grey : AppColors.grey2,
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          ),
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
                          news: widget.vm.newsList.articles![index],
                        ),
                      );
                    },
                    child: NewsCard(
                      link: widget.vm.newsList.articles![index].urlToImage!,
                      titleNews: widget.vm.newsList.articles![index].title!,
                      fontSize: widget.vm.fontSize,
                      light: widget.vm.isLight,
                    ),
                  ),
                );
              },
              childCount: widget.vm.newsList.articles!.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 3,
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
    );
  }
}
