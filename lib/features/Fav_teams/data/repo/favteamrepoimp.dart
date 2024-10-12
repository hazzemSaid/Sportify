// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sportify/core/utils/api/Api.dart';
import 'package:sportify/features/Fav_teams/data/repo/favteamrepo.dart';
import 'package:sportify/features/Fav_teams/presentation/view/screens/fav_football_team.dart';

class Favteamrepoimp implements FavTeamRepo {
  Api api;
  Favteamrepoimp({
    required this.api,
  });

  @override
  Future<List<Team>> getFavTeams() async {
    try {
      var response = await api.getTeams();
      List<Team> teams = [];
      for (int i = 0; i < response['teams'].length; i++) {
        if (response['teams'][i]['shortName'] == null ||
            response['teams'][i]['crest'] == null) {
          continue;
        }
        teams.add(Team(
            name: response['teams'][i]['shortName'] ?? 'Team Name',
            logoPath: response['teams'][i]['crest'] ?? ""));
      }
      teams.sort((a, b) => a.name.compareTo(b.name));
      return teams;
    } catch (e) {
      // Handle the error appropriately
      return [];
    }
  }
}
