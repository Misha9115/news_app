import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/domain/entity/push_notification.dart';
import 'package:news_paper/presentation/layouts/main_layouts.dart';
import 'package:news_paper/presentation/pages/home_page/home_page_vm.dart';
import 'package:news_paper/presentation/widgets/news_card.dart';
import 'package:news_paper/presentation/widgets/silver_grid_delegate.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/route_manager/models/news_page_data.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _singleChildScroll = ScrollController();

  double offset = 0.0;
  bool _paginationLoader = false;
  late final FirebaseMessaging _messaging;

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  }

  @override
  void initState() {
    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
    });

    super.initState();
  }

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
          bottomNavigationBar: true,
          appBar: false,
          body: vm.newsList.articles!.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.load,
                    style: AppFonts.loadingText,
                  ),
                )
              : loadingBooks(vm),
          selectedIndex: 0,
          title: AppLocalizations.of(context)!.news,
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
              title:  Text(
                AppLocalizations.of(context)!.lNews,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
              background: SizedBox(

                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/news.jpg',
                    fit: BoxFit.cover,
                    color: vm.light? AppColors.grey :AppColors.grey2,
                    colorBlendMode: BlendMode.modulate,
                  )),
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
    );
  }
}
