import 'package:dio/dio.dart';

class Api {
  static const String _baseUrl = 'https://api.football-data.org/v4/';
  final Dio _dio;
  Api(this._dio);

  Future<Map<String, dynamic>> GetMatch_ForToday(
      {required String endpoint}) async {
    //final String apiKey = '5dfbb5c2edc9437585893bf0b74ed63a';
    _dio.options.headers['X-Auth-Token'] = '5dfbb5c2edc9437585893bf0b74ed63a';
    var response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
    //dio transformer the json to dart object as automatically
  }

  Future<Map<String, dynamic>> Getmatch_detailes(
      {required int IdForMatch}) async {
    //final String apiKey = '5dfbb5c2edc9437585893bf0b74ed63a';
    _dio.options.headers['X-Auth-Token'] = '5dfbb5c2edc9437585893bf0b74ed63a';
    var response = await _dio.get('$_baseUrl/matches/$IdForMatch');
    return response.data;
    //dio transformer the json to dart object as automatically
  }

  Future<Map<String, dynamic>> GetStandingsleague(
      {required String league,
      required String season,
      required int matchday}) async {
    _dio.options.headers['X-Auth-Token'] = '5dfbb5c2edc9437585893bf0b74ed63a';
    var response = await _dio.get(
        '$_baseUrl/competitions/$league/standings?season=$season&matchday=$matchday');
    return response.data;
  }

  Future<Map<String, dynamic>> getTeamMatchesFixtures_Finished(
      {required String teamId}) async {
    // Use a logging framework instead of print
    _dio.options.headers['X-Auth-Token'] = '5dfbb5c2edc9437585893bf0b74ed63a';
    //{{url}}/v4/teams/65/matches
    print('$_baseUrl/teams/$teamId/matches');
    var response =
        await _dio.get('$_baseUrl/teams/$teamId/matches/?status=FINISHED');
    print('response: $response');
    return response.data;
  }

  Future<Map<String, dynamic>> getTeamMatchesFixtures_UPcoming(
      {required String teamId}) async {
    // Use a logging framework instead of print
    _dio.options.headers['X-Auth-Token'] = '5dfbb5c2edc9437585893bf0b74ed63a';
    //{{url}}/v4/teams/65/matches
    print('$_baseUrl/teams/$teamId/matches');
    var response =
        await _dio.get('$_baseUrl/teams/$teamId/matches/?status=SCHEDULED');
    print('response: $response');
    return response.data;
  }
}
