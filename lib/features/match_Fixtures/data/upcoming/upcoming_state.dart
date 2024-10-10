part of 'upcoming_cubit.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingLoaded extends UpcomingState {
  final List<dynamic>? matches;

  const UpcomingLoaded({required this.matches});
}

class UpcomingError extends UpcomingState {
  final String message;

  const UpcomingError({required this.message});
}



