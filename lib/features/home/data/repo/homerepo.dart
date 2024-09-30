import 'package:either_dart/either.dart';

import '../../../../core/utils/Failuer/Faiuer.dart';

abstract class HomeRepo {
  Either<Failure, Future<Map<String, dynamic>>> GetMatchesbyDate();
  Either<Failure, Future<Map<String, dynamic>>> GetDetailesMatch(
      {required int IdForMatch});
  //{{url}}/v4/competitions/PL/standings?season=2024&matchday=6
  Either<Failure, Future<Map<String, dynamic>>> GetStandingsleague(
      {required String league, required String season, required int matchday});
}
