import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';

class NewsState {
  final NewsListDto newsListDto;
  final int pageNumber;

  factory NewsState.initial() {
    return const NewsState(
        newsListDto: NewsListDto(
          totalResults: 0,
          status: '',
          articles: [],
        ),
        pageNumber: 1);
  }

  const NewsState({
    required this.newsListDto,
    required this.pageNumber,
  });

  NewsState copyWith({NewsListDto? newsListDto, int? pageNumber}) {
    return NewsState(
      newsListDto: newsListDto ?? this.newsListDto,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}
