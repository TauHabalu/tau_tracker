import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'models/body_model.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://pro-api.coinmarketcap.com/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("cryptocurrency/listings/latest")
  Future<CryptoListBody> getCryptoList( @Query("start") int start,
      @Query("limit") int limit,
      @Query("convert") String convert,
      @Header("X-CMC_PRO_API_KEY") String key
      );
}

