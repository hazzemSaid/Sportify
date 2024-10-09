part of 'match_fixtures_cubit.dart';

abstract class MatchFixturesState extends Equatable {
  const MatchFixturesState();

  @override
  List<Object> get props => [];
}

//{{url}}/v4/teams/65/matches
class MatchFixturesInitial extends MatchFixturesState {}

class MatchFixturesLoading extends MatchFixturesState {}

class MatchFixturesLoaded extends MatchFixturesState {
  final List<Match> matches;

  const MatchFixturesLoaded({required this.matches});
}

class MatchFixturesError extends MatchFixturesState {
  final String message;

  const MatchFixturesError({required this.message});
}
