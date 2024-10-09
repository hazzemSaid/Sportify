import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';
import 'package:sportify/core/utils/api/Api.dart';
import 'package:sportify/features/match_Fixtures/data/model/model_match_fixtures/model_match_fixtures.dart';
import 'package:sportify/features/match_Fixtures/data/repo/match_fixtrues.dart';

class MatchFixturesImpo implements MatchFixturesRepo {
  Api api;
  MatchFixturesImpo(this.api);
  @override
  Either<Failure, Future<List<ModelMatchFixtures>>> getMatchFixtures(
      {required String id}) {
    // Implement your logic here and return a valid Either<Exception, Future<List<ModelMatchFixtures>>>
    try {
      // Example implementation, replace with actual logic
      final fixtures = api.GetTeamMatches_fixtures(
          teamId: id); // Assuming this returns Future<List<ModelMatchFixtures>>
      return Right(fixtures as Future<List<ModelMatchFixtures>>);
    } catch (e) {
      return Left(Failure('Something went wrong'));
    }
  }
}
