import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';

abstract class IChatRepository {
  Future<NewsListDto> getNews();
  Future<NewsListDto> getNewsWithPagination({int pageSize, int page});
  Future<NewsListDto> getNewsWithParams({String q,int pageSize, int page,});
}
