
import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/network/i_chat_repository.dart';
import 'package:news_paper/network/rest_api.dart';
import 'package:news_paper/utils/locator.dart';

class ChatRepositoryImpl implements IChatRepository {
  @override
  Future<NewsListDto> getNews() async {
    NewsListDto response = await getIt<RestApiNews>().getNews('bitcoin', 'af4f1bb0e02b4dde8a0c72432081c7e8');

    return response;
  }
  @override
  Future<NewsListDto> getNewsWithPagination({ int? pageSize, int? page}) async {
    NewsListDto response = await getIt<RestApiNews>().getNewsWithPagination('af4f1bb0e02b4dde8a0c72432081c7e8','bitcoin', pageSize!,page!);

    return response;
  }

}
