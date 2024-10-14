import 'package:either_dart/src/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';
import 'package:sportify/core/utils/api/Api.dart';
import 'package:sportify/features/match_Fixtures/data/model/model_match_fixtures/match.dart';

import 'matchestabel.dart';

class Matchtabelimpo implements MatchTabelDayRepository {
  @override
  final Api api;

  Matchtabelimpo({required this.api});

  @override
  Either<Failure, dynamic> getMatchTabelDay({
    required String dateFrom,
    required String dateTo,
  }) {
    try {
      dynamic response = api.getMatchesbyDate(
          dateFrom: dateFrom,
          dateTo: dateTo); // Call the API to get the matches

      return Right(response); // Return the matches list wrapped in a Right
    } catch (e) {
      return Left(
          Failure(message: e.toString())); // Return the error wrapped in a Left
    }
  }
}
