import 'package:either_dart/either.dart';

import '../../../../core/utils/Failuer/Faiuer.dart';

abstract class HomeRepo {
  Either<Failure, Future<Map<String, dynamic>>> GetMatchesbyDate();
  Either<Failure, Future<Map<String, dynamic>>> GetDetailesMatch(
      {required int IdForMatch});
}
