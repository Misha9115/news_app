// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestApiNews implements RestApiNews {
  _RestApiNews(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://newsapi.org/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NewsListDto> getNews(searchWord, apiKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': searchWord,
      r'apiKey': apiKey
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NewsListDto>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options,
                '/everything?q=bitcoin&apiKey=f4bbfcb350a94322a45c9c82060ee070',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewsListDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NewsListDto> getNewsWithPagination(
      searchWord, apiKey, pageSize, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': searchWord,
      r'apiKey': apiKey
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        NewsListDto>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/everything?q=bitcoin&apiKey=f4bbfcb350a94322a45c9c82060ee070 &pageSize=${pageSize}&page=${page}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewsListDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
