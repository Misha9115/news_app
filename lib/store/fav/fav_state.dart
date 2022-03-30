import 'package:news_paper/domain/entity/articles/articles_dto.dart';

class FavState {
  final List<ArticlesDto> articlesDto;

  factory FavState.initial() {
    return FavState(articlesDto: <ArticlesDto>[]);
  }

  FavState({required this.articlesDto});

  FavState copyWith({List<ArticlesDto>? articlesDto}) {
    return FavState(
      articlesDto: articlesDto ?? this.articlesDto,
    );
  }
}
