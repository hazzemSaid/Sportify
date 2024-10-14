part of 'matchbydate_cubit.dart';

abstract class MatchbydateState extends Equatable {
  const MatchbydateState();

  @override
  List<Object> get props => [];
}

class MatchbydateInitial extends MatchbydateState {}

class MatchbydateLoading extends MatchbydateState {}

class MatchbydateLoaded extends MatchbydateState {
  final Map<String, dynamic> matches;

  MatchbydateLoaded({required this.matches});

  @override
  List<Object> get props => [matches];
}

class MatchbydateError extends MatchbydateState {
  final String message;

  MatchbydateError({required this.message});

  @override
  List<Object> get props => [message];
}
