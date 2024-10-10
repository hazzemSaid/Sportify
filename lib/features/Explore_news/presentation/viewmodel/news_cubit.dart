import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/features/Explore_news/data/repo/explore_repo_impo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final ExploreRepoImpo exploreRepoImpo;

  NewsCubit(this.exploreRepoImpo) : super(NewsInitial());

  Future<void> fetchNews() async {
    emit(NewsLoading());
    final news = await exploreRepoImpo.FeatchNews();
    news.fold(
      (l) => emit(NewsError(message: l.message)),
      (r) => emit(NewsLoaded(news: r)),
    );
  }
}
