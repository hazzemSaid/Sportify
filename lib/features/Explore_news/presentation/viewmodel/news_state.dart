part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;

  NewsLoaded({required this.news});

  @override
  List<Object> get props => [news];
}

class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});

  @override
  List<Object> get props => [message];
}
