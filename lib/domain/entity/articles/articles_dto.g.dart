// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'articles_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticlesDto _$$_ArticlesDtoFromJson(Map<String, dynamic> json) =>
    _$_ArticlesDto(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
      source: json['source'] == null
          ? null
          : SourceDto.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ArticlesDtoToJson(_$_ArticlesDto instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
      'source': instance.source,
    };
