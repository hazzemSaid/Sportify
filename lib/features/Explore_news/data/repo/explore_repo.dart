import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';
import 'package:sportify/features/Explore_news/data/models/news/news.dart';

abstract class NewsStates {
  Future<Either<Failure, List<News>>> FeatchNews();
}
