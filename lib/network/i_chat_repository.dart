import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';

abstract class IChatRepository {
  Future<NewsListDto> getNews(/*{int pageSize,String searchWord,String apiKey}*/);
  Future<NewsListDto> getNewsWithPagination({int pageSize, int page});
//  Future<List<BaseBook>> searchByNameBooks({String text, double latitude, double longitude, int distance, int offset, int count});
}
