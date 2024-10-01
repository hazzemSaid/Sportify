part of 'match_day_cubit.dart';

abstract class MatchDayState extends Equatable {
  const MatchDayState();

  @override
  List<Object> get props => [];
}

class MatchDayInitial extends MatchDayState {}

class MatchDayLoading extends MatchDayState {}

class MatchDayError extends MatchDayState {
  final String message;
  const MatchDayError({required this.message});
}

class MatchDayLoaded extends MatchDayState {
  final List<Matche>? matches;
  const MatchDayLoaded({required this.matches});
}
