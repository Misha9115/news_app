import 'package:flutter/material.dart';
import 'package:news_paper/res/app_consts.dart';

class NewsCard extends StatelessWidget {
  final String titleNews;
  final String? link;

  const NewsCard({
    required this.titleNews,
    required this.link,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(100, 102, 102, 153),
      height: 150.0,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 100.0,
            child: FadeInImage.assetNetwork(
              placeholder: logo,
              image: link ?? imageURL,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 50.0,
            child: Text(titleNews),
          ),
        ],
      ),
    );
  }
}
