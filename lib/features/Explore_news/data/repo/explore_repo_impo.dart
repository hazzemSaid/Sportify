import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';
import 'package:sportify/core/utils/api/Api.dart';
import 'package:sportify/features/Explore_news/data/repo/explore_repo.dart';

class ExploreRepoImpo implements NewsStates {
  @override
  Api api;
  ExploreRepoImpo(this.api);
  Future<Either<Failure, dynamic>> FeatchNews() async {
    try {
      final response = await api.getNews();
      return Right(response);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
