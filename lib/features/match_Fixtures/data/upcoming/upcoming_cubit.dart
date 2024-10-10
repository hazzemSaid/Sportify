import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/features/match_Fixtures/data/repo/match_fixtures_impo.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  MatchFixturesImpo matchFixturesImpo;
  UpcomingCubit(this.matchFixturesImpo) : super(UpcomingInitial());

  void getMatchFixturesS({required String id}) async {
    emit(UpcomingLoading());
    final fixtures = await matchFixturesImpo.getMatchFixtures_UPcoming(id: id);
    print(fixtures);
    fixtures.fold((l) {
      emit(UpcomingError(message: 'Something went wrong'));
    }, (r) {
      emit(UpcomingLoaded(matches: r['matches']));
    });
  }
}
