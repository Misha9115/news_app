// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_dto.freezed.dart';
 part 'articles_dto.g.dart';

@freezed
class ArticlesDto with _$ArticlesDto {
  const factory ArticlesDto({
    @JsonKey(name: 'author') required final String? author,
    @JsonKey(name: 'title') required final String? title,
    @JsonKey(name: 'description') required final String? description,
    @JsonKey(name: 'url') required final String? url,
    @JsonKey(name: 'urlToImage') required final String? urlToImage,
    @JsonKey(name: 'publishedAt') required final String? publishedAt,
    @JsonKey(name: 'content') required final String? content,
  }) = _ArticlesDto;

  factory ArticlesDto.fromJson(Map<String, dynamic> json) =>
      _$ArticlesDtoFromJson(json);
}
