import '../../presentation/view/screens/fav_football_team.dart';

abstract class FavTeamRepo {
  Future<List<Team>> getFavTeams();
}
