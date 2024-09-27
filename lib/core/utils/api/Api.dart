import 'package:dio/dio.dart';

class Api {
  static const String _baseUrl = 'https://api.football-data.org/v4/';
  final Dio _dio;
  Api(this._dio);

  Future<Map<String, dynamic>> GetMatch_ForToday(String endpoint) async {
    //final String apiKey = '5dfbb5c2edc9437585893bf0b74ed63a';
    _dio.options.headers['X-Auth-Token'] = '5dfbb5c2edc9437585893bf0b74ed63a';
    var response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
    //dio transformer the json to dart object as automatically
  }
}
