import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/features/Explore_news/data/models/news/news.dart';
import 'package:sportify/features/Explore_news/data/repo/explore_repo_impo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final ExploreRepoImpo exploreRepoImpo;

  NewsCubit(super.initialState, {required this.exploreRepoImpo});

  Future<void> fetchNews() async {
    emit(NewsLoading());
    final response = await exploreRepoImpo.FeatchNews();
    if (response.isRight) {
      print('News fetched successfully');
      print(response.right);
    }
    response.fold(
      (l) => emit(NewsError(message: l.message)),
      (r) => emit(NewsLoaded(news: r)),
    );
  }
}
