part of 'standing_cubit.dart';

abstract class StandingState extends Equatable {
  const StandingState();

  @override
  List<Object> get props => [];
}

class StandingInitial extends StandingState {}

class StandingLoading extends StandingState {}

class StandingLoaded extends StandingState {
  final List<Tables> teams;

  const StandingLoaded({required this.teams});
}

class StandingError extends StandingState {
  final String message;
  const StandingError({required this.message});
}
