part of 'favteams_cubit.dart';

abstract class FavteamsState extends Equatable {
  const FavteamsState();

  @override
  List<Object> get props => [];
}

class FavteamsInitial extends FavteamsState {}

class FavteamsLoading extends FavteamsState {}

class FavteamsLoaded extends FavteamsState {
  final List<Team> teams;
  FavteamsLoaded(this.teams);
  @override
  List<Object> get props => [teams];
}

class FavteamsError extends FavteamsState {
  final String message;
  FavteamsError(this.message);
  @override
  List<Object> get props => [message];
}
