import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/route_helper/IPageData.dart';

class NewsPageData implements IPageData {
  final ArticlesDto news;

  NewsPageData({
    required this.news,
  });
}
