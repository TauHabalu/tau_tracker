// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://pro-api.coinmarketcap.com/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<CryptoListBody> getCryptoList(start, limit, convert, key) async {
    ArgumentError.checkNotNull(start, 'start');
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(convert, 'convert');
    ArgumentError.checkNotNull(key, 'key');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'start': start,
      r'limit': limit,
      r'convert': convert
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'cryptocurrency/listings/latest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'X-CMC_PRO_API_KEY': key},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CryptoListBody.fromJson(_result.data);
    return value;
  }
}
