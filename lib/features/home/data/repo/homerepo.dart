import 'package:either_dart/either.dart';
import 'package:sportify/features/home/data/model/matchesbydate/matchesbydate.dart';

import '../../../../core/utils/Failuer/Faiuer.dart';

abstract class HomeRepo {
  Either<Failure, Future<Map<String, dynamic>>> GetMatchesbyDate();
}
