import 'package:either_dart/either.dart';
import 'package:sportify/core/utils/Failuer/Faiuer.dart';

abstract class NewsStates {
  Future<Either<Failure, dynamic>> FeatchNews();
}
