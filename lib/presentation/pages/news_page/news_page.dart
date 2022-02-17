import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/presentation/pages/news_page/news_page_vm.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  final ArticlesDto news;

  const NewsPage({required this.news, Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsPageVM>(
      converter: NewsPageVM.init,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Bitcoin'),
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
                    color: const Color.fromARGB(255, 102, 102, 153),
                    child: Text(DateFormat("Md").format(DateTime.parse(widget.news.publishedAt!)),
                        style: const TextStyle(fontWeight: FontWeight.bold, height: 20.0)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: const Color.fromARGB(255, 102, 102, 153),
                    child: Text(widget.news.author ?? ''),
                  ),
                ),
              ]),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                          child: const Text(
                            'Read more...',
                            style: TextStyle(color: Colors.blue, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.news.title!,
                      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
