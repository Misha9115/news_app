// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsListDto _$NewsListDtoFromJson(Map<String, dynamic> json) {
  return _NewsListDto.fromJson(json);
}

/// @nodoc
class _$NewsListDtoTearOff {
  const _$NewsListDtoTearOff();

  _NewsListDto call(
      {@JsonKey(name: 'status') required String? status,
      @JsonKey(name: 'totalResults') required int? totalResults,
      @JsonKey(name: 'articles') required List<ArticlesDto>? articles}) {
    return _NewsListDto(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }

  NewsListDto fromJson(Map<String, Object?> json) {
    return NewsListDto.fromJson(json);
  }
}

/// @nodoc
const $NewsListDto = _$NewsListDtoTearOff();

/// @nodoc
mixin _$NewsListDto {
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalResults')
  int? get totalResults => throw _privateConstructorUsedError;
  @JsonKey(name: 'articles')
  List<ArticlesDto>? get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsListDtoCopyWith<NewsListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsListDtoCopyWith<$Res> {
  factory $NewsListDtoCopyWith(
          NewsListDto value, $Res Function(NewsListDto) then) =
      _$NewsListDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'totalResults') int? totalResults,
      @JsonKey(name: 'articles') List<ArticlesDto>? articles});
}

/// @nodoc
class _$NewsListDtoCopyWithImpl<$Res> implements $NewsListDtoCopyWith<$Res> {
  _$NewsListDtoCopyWithImpl(this._value, this._then);

  final NewsListDto _value;
  // ignore: unused_field
  final $Res Function(NewsListDto) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticlesDto>?,
    ));
  }
}

/// @nodoc
abstract class _$NewsListDtoCopyWith<$Res>
    implements $NewsListDtoCopyWith<$Res> {
  factory _$NewsListDtoCopyWith(
          _NewsListDto value, $Res Function(_NewsListDto) then) =
      __$NewsListDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'totalResults') int? totalResults,
      @JsonKey(name: 'articles') List<ArticlesDto>? articles});
}

/// @nodoc
class __$NewsListDtoCopyWithImpl<$Res> extends _$NewsListDtoCopyWithImpl<$Res>
    implements _$NewsListDtoCopyWith<$Res> {
  __$NewsListDtoCopyWithImpl(
      _NewsListDto _value, $Res Function(_NewsListDto) _then)
      : super(_value, (v) => _then(v as _NewsListDto));

  @override
  _NewsListDto get _value => super._value as _NewsListDto;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_NewsListDto(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticlesDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsListDto implements _NewsListDto {
  const _$_NewsListDto(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'totalResults') required this.totalResults,
      @JsonKey(name: 'articles') required this.articles});

  factory _$_NewsListDto.fromJson(Map<String, dynamic> json) =>
      _$$_NewsListDtoFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'totalResults')
  final int? totalResults;
  @override
  @JsonKey(name: 'articles')
  final List<ArticlesDto>? articles;

  @override
  String toString() {
    return 'NewsListDto(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsListDto &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults) &&
            const DeepCollectionEquality().equals(other.articles, articles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(totalResults),
      const DeepCollectionEquality().hash(articles));

  @JsonKey(ignore: true)
  @override
  _$NewsListDtoCopyWith<_NewsListDto> get copyWith =>
      __$NewsListDtoCopyWithImpl<_NewsListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsListDtoToJson(this);
  }
}

abstract class _NewsListDto implements NewsListDto {
  const factory _NewsListDto(
          {@JsonKey(name: 'status') required String? status,
          @JsonKey(name: 'totalResults') required int? totalResults,
          @JsonKey(name: 'articles') required List<ArticlesDto>? articles}) =
      _$_NewsListDto;

  factory _NewsListDto.fromJson(Map<String, dynamic> json) =
      _$_NewsListDto.fromJson;

  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'totalResults')
  int? get totalResults;
  @override
  @JsonKey(name: 'articles')
  List<ArticlesDto>? get articles;
  @override
  @JsonKey(ignore: true)
  _$NewsListDtoCopyWith<_NewsListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
