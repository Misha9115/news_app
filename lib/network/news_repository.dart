import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/network/rest_api.dart';
import 'package:news_paper/shared/locator.dart';

class NewsRepository {
  Future<NewsListDto> getNews() async {
    NewsListDto response = await getIt<RestApiNews>().getNews('bitcoin', 'af4f1bb0e02b4dde8a0c72432081c7e8');

    return response;
  }

  Future<NewsListDto> getNewsWithPagination({int? pageSize, int? page}) async {
    NewsListDto response = await getIt<RestApiNews>().getNewsWithPagination('af4f1bb0e02b4dde8a0c72432081c7e8', 'bitcoin', pageSize!, page!);

    return response;
  }

  Future<NewsListDto> getNewsWithParams({int? pageSize, int? page, String? q}) async {
    NewsListDto response = await getIt<RestApiNews>().getNewsWithParams(q!, 'af4f1bb0e02b4dde8a0c72432081c7e8', pageSize!, page!);

    return response;
  }
}
