import 'package:json_annotation/json_annotation.dart';
part 'body_model.g.dart';

@JsonSerializable()
class CryptoListBody {
  List<CryptoDataBody> data;

  CryptoListBody({this.data});

  factory CryptoListBody.fromJson(Map<String, dynamic> json) => _$CryptoListBodyFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoListBodyToJson(this);
}

@JsonSerializable()
class CryptoDataBody {
  String name;
  String symbol;
  int cmc_rank;
  CryptoQuotaBody quote;

  CryptoDataBody({this.name, this.symbol, this.cmc_rank,
    this.quote
  });

  factory CryptoDataBody.fromJson(Map<String, dynamic> json) => _$CryptoDataBodyFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoDataBodyToJson(this);
}

@JsonSerializable()
class CryptoQuotaBody {
  CryptoUsdBody USD;

  CryptoQuotaBody({this.USD});

  factory CryptoQuotaBody.fromJson(Map<String, dynamic> json) => _$CryptoQuotaBodyFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoQuotaBodyToJson(this);
}

@JsonSerializable()
class CryptoUsdBody {
  double price;

  CryptoUsdBody({this.price});

  factory CryptoUsdBody.fromJson(Map<String, dynamic> json) => _$CryptoUsdBodyFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoUsdBodyToJson(this);
}