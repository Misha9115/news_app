import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';

class NewsCard extends StatelessWidget {
  final String titleNews;
  final String? link;
  final double fontSize;
  final bool light;

  const NewsCard({
    required this.titleNews,
    required this.link,
    required this.fontSize,
    required this.light,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      margin: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 102, 102, 153),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.5), topRight: Radius.circular(16.5)),
              child: FadeInImage.assetNetwork(
                placeholder: logo,
                image: link ?? imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            height: 50.0,
            child: Text(
              titleNews,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: light ? AppColors.white.withOpacity(0.8) : AppColors.black,
                fontFamily: fontFamily,
                fontSize: 10.0 * fontSize,
                height: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
