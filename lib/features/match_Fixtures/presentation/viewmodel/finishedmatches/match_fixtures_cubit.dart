import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/features/match_Fixtures/data/repo/match_fixtures_impo.dart';

part 'match_fixtures_state.dart';

class MatchFixturesCubit extends Cubit<MatchFixturesState> {
  MatchFixturesImpo matchFixturesImpo;
  MatchFixturesCubit(this.matchFixturesImpo) : super(MatchFixturesInitial());

  void getMatchFixtures({required String id}) async {
    emit(MatchFixturesLoading());
    final fixtures = await matchFixturesImpo.getMatchFixtures_FINISHED(id: id);
    print(fixtures);
    fixtures.fold((l) {
      emit(MatchFixturesError(message: 'Something went wrong'));
    }, (r) {
      emit(MatchFixturesLoaded(matches: r['matches']));
    });
  }

  @override
  void onChange(Change<MatchFixturesState> change) {
    super.onChange(change);
    print(change);
    print(change.currentState);
    print(change.nextState);
  }
}
