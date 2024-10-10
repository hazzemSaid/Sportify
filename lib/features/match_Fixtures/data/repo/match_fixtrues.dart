import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';

abstract class MatchFixturesRepo {
  //{{url}}/v4/teams/65/matches

  Future<Either<Failure, Map<String, dynamic>>> getMatchFixtures_FINISHED(
      {required String id});

  Future<Either<Failure, Map<String, dynamic>>> getMatchFixtures_UPcoming(
      {required String id});
}
