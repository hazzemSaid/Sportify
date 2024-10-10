import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/api/Api.dart';
import 'package:sportify/features/Home/data/repo/homerepo.dart';

import '../../../../core/utils/Failuer/Faiuer.dart';

class Homerepoimp implements HomeRepo {
  @override
  final Api api;
  Homerepoimp(this.api);
  Either<Failure, Future<Map<String, dynamic>>> GetMatchesbyDate({
    required String dateFrom,
    required String dateTo,
  }) {
    try {
      //end point for today matches->?dateFrom=2024-09-28&dateTo=2024-09-29&competitions=PL
      return Right(
        api.GetMatch_ForToday(
          endpoint: 'matches?dateFrom=$dateFrom&dateTo=$dateTo',
        ),
      );
    } catch (e) {
      return Left(Failure(message: 'Something went wrong'));
    }
  }

  @override
  Either<Failure, Future<Map<String, dynamic>>> GetDetailesMatch(
      {required int IdForMatch}) {
    try {
      return Right(
        api.Getmatch_detailes(IdForMatch: IdForMatch),
      );
    } catch (e) {
      return Left(Failure(message: 'Something went wrong'));
    }
  }

  @override
  Either<Failure, Future<Map<String, dynamic>>> GetStandingsleague(
      {required String league, required String season, required int matchday}) {
    try {
      return Right(
        api.GetStandingsleague(
          league: league,
          season: season,
          matchday: 32,
        ),
      );
    } catch (e) {
      return Left(Failure(message: 'Something went wrong'));
    }
  }
}
