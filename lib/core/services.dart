import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Services {
  //here i put chat gpt api key get from env file in a constant variable named ikey
  static final ikey = dotenv.env['api_key'];
  static Future<dynamic> post(dynamic data) async {
    try {
      var headers = {'Authorization':'Bearer $ikey' ,'Content-Type': 'application/json'};
      String url = "https://chatgpt-api.shn.hk/v1/";
      return await Dio().post(
        url,
        data: data,
        options: Options(headers: headers),
      );
    } on DioError catch (e) {
      return e.message!;
    }
  }
}