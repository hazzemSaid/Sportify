import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';

abstract class MatchTabelDayRepository {
  Either<Failure, dynamic> getMatchTabelDay({
    required String dateFrom,
    required String dateTo,
  });
}
