import 'package:dio/dio.dart';
import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:retrofit/http.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2")
abstract class RestApiNews {
  factory RestApiNews(
    Dio dio, {
    String baseUrl,
  }) = _RestApiNews;

  @GET('/everything?q=bitcoin&apiKey=f4bbfcb350a94322a45c9c82060ee070')
  Future<NewsListDto> getNews(
    @Query("q") String searchWord,
    @Query("apiKey") String apiKey,
  );

  @GET('/everything?q=bitcoin&apiKey=f4bbfcb350a94322a45c9c82060ee070 &pageSize={pageSize}&page={page}')
  Future<NewsListDto> getNewsWithPagination(
      @Query("q") String searchWord,
      @Query("apiKey") String apiKey,
      @Path("pageSize") int pageSize,
      @Path("page") int page,
      );
}

