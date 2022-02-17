// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_paper/domain/entity/articles/articles_dto.dart';

part 'news_list_dto.freezed.dart';
part 'news_list_dto.g.dart';

@freezed
class NewsListDto with _$NewsListDto {
  const factory NewsListDto({
        @JsonKey(name: 'status')required final String? status,
    @JsonKey(name: 'totalResults')required final int? totalResults,
    @JsonKey(name: 'articles')required final List<ArticlesDto>? articles,

  }) = _NewsListDto;

  factory NewsListDto.fromJson(Map<String, dynamic> json) =>
      _$NewsListDtoFromJson(json);
}
