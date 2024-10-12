import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/features/Fav_teams/data/repo/favteamrepoimp.dart';
import 'package:sportify/features/Fav_teams/presentation/view/screens/fav_football_team.dart';

part 'favteams_state.dart';

class FavteamsCubit extends Cubit<FavteamsState> {
  Favteamrepoimp repo;
  FavteamsCubit({
    required this.repo,
  }) : super(FavteamsInitial());

  void getFavTeams() async {
    emit(FavteamsLoading());
    try {
      List<Team> teams = await repo.getFavTeams();
      print(teams);
      emit(FavteamsLoaded(teams));
    } catch (e) {
      emit(FavteamsError('Error fetching teams'));
    }
  }
}
