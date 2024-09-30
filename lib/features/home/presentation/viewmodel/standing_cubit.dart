import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/features/home/data/model/Standing_League/standings_league/table.dart';
import 'package:sportify/features/home/data/model/Standing_League/standings_league/team.dart';
import 'package:sportify/features/home/data/repo/homerepoImp.dart';

part 'standing_state.dart';

class StandingCubit extends Cubit<StandingState> {
  final Homerepoimp repo;
  StandingCubit(this.repo) : super(StandingInitial());
  Future<void> getStandingByLeague(
      {required String league,
      required String season,
      required int matchDay}) async {
    emit(StandingLoading());
    final result = await repo.GetStandingsleague(
      league: league,
      season: season,
      matchday: matchDay,
    );

    result.fold(
      (failure) {
        emit(StandingError(message: failure.message));
      },
      (standings) async {
        final standingsData = await standings;
        final List<Tables> tables = [];
        for (var item in standingsData['standings'][0]['table']) {
          final team = Team(
            id: item['team']['id'],
            name: item['team']['name'],
          );
          final table = Tables(
            team: team,
            position: item['position'],
            playedGames: item['playedGames'],
            won: item['won'],
            draw: item['draw'],
            lost: item['lost'],
            points: item['points'],
            goalsFor: item['goalsFor'],
            goalsAgainst: item['goalsAgainst'],
            goalDifference: item['goalDifference'],
          );
          tables.add(table);
        }
        emit(StandingLoaded(teams: tables));
      },
    );
  }
}
