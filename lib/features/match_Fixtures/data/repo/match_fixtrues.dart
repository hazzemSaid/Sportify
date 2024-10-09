import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';
import 'package:sportify/features/match_Fixtures/data/model/model_match_fixtures/model_match_fixtures.dart';

abstract class MatchFixturesRepo {
  //{{url}}/v4/teams/65/matches
  Either<Failure, Future<List<ModelMatchFixtures>>> getMatchFixtures({
    required String id,
  });
}
