// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'source_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SourceDto _$SourceDtoFromJson(Map<String, dynamic> json) {
  return _SourceDto.fromJson(json);
}

/// @nodoc
class _$SourceDtoTearOff {
  const _$SourceDtoTearOff();

  _SourceDto call(
      {@JsonKey(name: 'id') required String? id,
      @JsonKey(name: 'name') required String? name}) {
    return _SourceDto(
      id: id,
      name: name,
    );
  }

  SourceDto fromJson(Map<String, Object?> json) {
    return SourceDto.fromJson(json);
  }
}

/// @nodoc
const $SourceDto = _$SourceDtoTearOff();

/// @nodoc
mixin _$SourceDto {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceDtoCopyWith<SourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceDtoCopyWith<$Res> {
  factory $SourceDtoCopyWith(SourceDto value, $Res Function(SourceDto) then) =
      _$SourceDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id, @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$SourceDtoCopyWithImpl<$Res> implements $SourceDtoCopyWith<$Res> {
  _$SourceDtoCopyWithImpl(this._value, this._then);

  final SourceDto _value;
  // ignore: unused_field
  final $Res Function(SourceDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SourceDtoCopyWith<$Res> implements $SourceDtoCopyWith<$Res> {
  factory _$SourceDtoCopyWith(
          _SourceDto value, $Res Function(_SourceDto) then) =
      __$SourceDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id, @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$SourceDtoCopyWithImpl<$Res> extends _$SourceDtoCopyWithImpl<$Res>
    implements _$SourceDtoCopyWith<$Res> {
  __$SourceDtoCopyWithImpl(_SourceDto _value, $Res Function(_SourceDto) _then)
      : super(_value, (v) => _then(v as _SourceDto));

  @override
  _SourceDto get _value => super._value as _SourceDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_SourceDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SourceDto implements _SourceDto {
  const _$_SourceDto(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name});

  factory _$_SourceDto.fromJson(Map<String, dynamic> json) =>
      _$$_SourceDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'SourceDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SourceDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$SourceDtoCopyWith<_SourceDto> get copyWith =>
      __$SourceDtoCopyWithImpl<_SourceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SourceDtoToJson(this);
  }
}

abstract class _SourceDto implements SourceDto {
  const factory _SourceDto(
      {@JsonKey(name: 'id') required String? id,
      @JsonKey(name: 'name') required String? name}) = _$_SourceDto;

  factory _SourceDto.fromJson(Map<String, dynamic> json) =
      _$_SourceDto.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$SourceDtoCopyWith<_SourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
