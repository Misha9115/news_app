// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'source_dto.freezed.dart';
part 'source_dto.g.dart';

@freezed
class SourceDto with _$SourceDto {
  const factory SourceDto({
    @JsonKey(name: 'id')required final String? id,
    @JsonKey(name: 'name')required final String? name,
  }) = _SourceDto;

  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);
}
