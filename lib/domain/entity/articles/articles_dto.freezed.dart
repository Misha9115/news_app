// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'articles_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticlesDto _$ArticlesDtoFromJson(Map<String, dynamic> json) {
  return _ArticlesDto.fromJson(json);
}

/// @nodoc
class _$ArticlesDtoTearOff {
  const _$ArticlesDtoTearOff();

  _ArticlesDto call(
      {@JsonKey(name: 'author') required String? author,
      @JsonKey(name: 'title') required String? title,
      @JsonKey(name: 'description') required String? description,
      @JsonKey(name: 'url') required String? url,
      @JsonKey(name: 'urlToImage') required String? urlToImage,
      @JsonKey(name: 'publishedAt') required String? publishedAt,
      @JsonKey(name: 'content') required String? content}) {
    return _ArticlesDto(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }

  ArticlesDto fromJson(Map<String, Object?> json) {
    return ArticlesDto.fromJson(json);
  }
}

/// @nodoc
const $ArticlesDto = _$ArticlesDtoTearOff();

/// @nodoc
mixin _$ArticlesDto {
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'urlToImage')
  String? get urlToImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishedAt')
  String? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlesDtoCopyWith<ArticlesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesDtoCopyWith<$Res> {
  factory $ArticlesDtoCopyWith(
          ArticlesDto value, $Res Function(ArticlesDto) then) =
      _$ArticlesDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'urlToImage') String? urlToImage,
      @JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class _$ArticlesDtoCopyWithImpl<$Res> implements $ArticlesDtoCopyWith<$Res> {
  _$ArticlesDtoCopyWithImpl(this._value, this._then);

  final ArticlesDto _value;
  // ignore: unused_field
  final $Res Function(ArticlesDto) _then;

  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? publishedAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: urlToImage == freezed
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ArticlesDtoCopyWith<$Res>
    implements $ArticlesDtoCopyWith<$Res> {
  factory _$ArticlesDtoCopyWith(
          _ArticlesDto value, $Res Function(_ArticlesDto) then) =
      __$ArticlesDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'urlToImage') String? urlToImage,
      @JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class __$ArticlesDtoCopyWithImpl<$Res> extends _$ArticlesDtoCopyWithImpl<$Res>
    implements _$ArticlesDtoCopyWith<$Res> {
  __$ArticlesDtoCopyWithImpl(
      _ArticlesDto _value, $Res Function(_ArticlesDto) _then)
      : super(_value, (v) => _then(v as _ArticlesDto));

  @override
  _ArticlesDto get _value => super._value as _ArticlesDto;

  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlToImage = freezed,
    Object? publishedAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_ArticlesDto(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: urlToImage == freezed
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticlesDto implements _ArticlesDto {
  const _$_ArticlesDto(
      {@JsonKey(name: 'author') required this.author,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'urlToImage') required this.urlToImage,
      @JsonKey(name: 'publishedAt') required this.publishedAt,
      @JsonKey(name: 'content') required this.content});

  factory _$_ArticlesDto.fromJson(Map<String, dynamic> json) =>
      _$$_ArticlesDtoFromJson(json);

  @override
  @JsonKey(name: 'author')
  final String? author;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'urlToImage')
  final String? urlToImage;
  @override
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @override
  @JsonKey(name: 'content')
  final String? content;

  @override
  String toString() {
    return 'ArticlesDto(author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArticlesDto &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.urlToImage, urlToImage) &&
            const DeepCollectionEquality()
                .equals(other.publishedAt, publishedAt) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(urlToImage),
      const DeepCollectionEquality().hash(publishedAt),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$ArticlesDtoCopyWith<_ArticlesDto> get copyWith =>
      __$ArticlesDtoCopyWithImpl<_ArticlesDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticlesDtoToJson(this);
  }
}

abstract class _ArticlesDto implements ArticlesDto {
  const factory _ArticlesDto(
      {@JsonKey(name: 'author') required String? author,
      @JsonKey(name: 'title') required String? title,
      @JsonKey(name: 'description') required String? description,
      @JsonKey(name: 'url') required String? url,
      @JsonKey(name: 'urlToImage') required String? urlToImage,
      @JsonKey(name: 'publishedAt') required String? publishedAt,
      @JsonKey(name: 'content') required String? content}) = _$_ArticlesDto;

  factory _ArticlesDto.fromJson(Map<String, dynamic> json) =
      _$_ArticlesDto.fromJson;

  @override
  @JsonKey(name: 'author')
  String? get author;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'urlToImage')
  String? get urlToImage;
  @override
  @JsonKey(name: 'publishedAt')
  String? get publishedAt;
  @override
  @JsonKey(name: 'content')
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$ArticlesDtoCopyWith<_ArticlesDto> get copyWith =>
      throw _privateConstructorUsedError;
}
