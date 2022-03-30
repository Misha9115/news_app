import 'package:news_paper/domain/entity/articles/articles_dto.dart';


class SearchNewsState {
  final List<ArticlesDto> searchNewsListDto;
  final int pageNumber;

  factory SearchNewsState.initial() {
    return const SearchNewsState(
      searchNewsListDto: [],
      pageNumber: 1,
    );
  }

  const SearchNewsState({
    required this.searchNewsListDto,
    required this.pageNumber,
  });

  SearchNewsState copyWith({List<ArticlesDto>? searchNewsListDto, int? pageNumber}) {
    return SearchNewsState(
      searchNewsListDto: searchNewsListDto ?? this.searchNewsListDto,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }


}
