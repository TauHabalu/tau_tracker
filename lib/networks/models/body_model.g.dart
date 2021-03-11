// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoListBody _$CryptoListBodyFromJson(Map<String, dynamic> json) {
  return CryptoListBody(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : CryptoDataBody.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CryptoListBodyToJson(CryptoListBody instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CryptoDataBody _$CryptoDataBodyFromJson(Map<String, dynamic> json) {
  return CryptoDataBody(
    name: json['name'] as String,
    symbol: json['symbol'] as String,
    cmc_rank: json['cmc_rank'] as int,
    quote: json['quote'] == null
        ? null
        : CryptoQuotaBody.fromJson(json['quote'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CryptoDataBodyToJson(CryptoDataBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'cmc_rank': instance.cmc_rank,
      'quote': instance.quote,
    };

CryptoQuotaBody _$CryptoQuotaBodyFromJson(Map<String, dynamic> json) {
  return CryptoQuotaBody(
    USD: json['USD'] == null
        ? null
        : CryptoUsdBody.fromJson(json['USD'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CryptoQuotaBodyToJson(CryptoQuotaBody instance) =>
    <String, dynamic>{
      'USD': instance.USD,
    };

CryptoUsdBody _$CryptoUsdBodyFromJson(Map<String, dynamic> json) {
  return CryptoUsdBody(
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CryptoUsdBodyToJson(CryptoUsdBody instance) =>
    <String, dynamic>{
      'price': instance.price,
    };
