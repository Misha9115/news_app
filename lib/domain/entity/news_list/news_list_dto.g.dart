// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsListDto _$$_NewsListDtoFromJson(Map<String, dynamic> json) =>
    _$_NewsListDto(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticlesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NewsListDtoToJson(_$_NewsListDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
