import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';
import 'package:sportify/core/utils/api/Api.dart';
import 'package:sportify/features/match_Fixtures/data/repo/match_fixtrues.dart';

class MatchFixturesImpo implements MatchFixturesRepo {
  Api api;
  MatchFixturesImpo(this.api);
  @override
  Future<Either<Failure, Map<String, dynamic>>> getMatchFixtures_FINISHED(
      {required String id}) async {
    // Implement your logic here and return a valid Either<Exception, Future<List<ModelMatchFixtures>>>
    try {
      // Example implementation, replace with actual logic
      final fixtures = await api.getTeamMatchesFixtures_Finished(teamId: id);
      // Assuming this returns Future<List<ModelMatchFixtures>>
      return (Right(fixtures));
    } catch (e) {
      return (Left(Failure(message: 'Something went wrong')));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getMatchFixtures_UPcoming(
      {required String id}) async {
    try {
      // Example implementation, replace with actual logic
      final fixtures = await api.getTeamMatchesFixtures_UPcoming(teamId: id);
      // Assuming this returns Future<List<ModelMatchFixtures>>
      return (Right(fixtures));
    } catch (e) {
      return (Left(Failure(message: 'Something went wrong')));
    }
  }
}
