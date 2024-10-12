import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // إضافة shared_preferences
import 'package:sportify/core/utils/routes/routes.dart';
import 'package:sportify/features/Fav_teams/presentation/viewmodel/favteams_cubit.dart';

class FavFootballTeam extends StatefulWidget {
  const FavFootballTeam({super.key});

  @override
  State<FavFootballTeam> createState() => _FavFootballTeamState();
}

class Team {
  final String name;
  final String logoPath;
  bool isFollowing;

  Team({
    required this.name,
    required this.logoPath,
    this.isFollowing = false,
  });

  // تحويل الفريق إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'logoPath': logoPath,
      'isFollowing': isFollowing,
    };
  }

  // إنشاء فريق من JSON
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      logoPath: json['logoPath'],
      isFollowing: json['isFollowing'] ?? false,
    );
  }
}

class _FavFootballTeamState extends State<FavFootballTeam> {
  final List<Team> teams = [];

  @override
  void initState() {
    super.initState();
    _loadFollowingTeams();
    context.read<FavteamsCubit>().getFavTeams();
  }

  // تحميل الفرق المتابعة من SharedPreferences
  Future<void> _loadFollowingTeams() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedTeams = prefs.getStringList('followingTeams');
    if (savedTeams != null) {
      setState(() {
        for (var teamJson in savedTeams) {
          teams.add(
              Team.fromJson(Map<String, dynamic>.from(jsonDecode(teamJson))));
        }
      });
    }
  }

  // تخزين الفرق المتابعة في SharedPreferences
  Future<void> _saveFollowingTeams() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> savedTeams =
        teams.map((team) => jsonEncode(team.toJson())).toList();
    await prefs.setStringList('followingTeams', savedTeams);
  }

  // تغيير حالة المتابعة وحفظها
  void toggleFollow(Team team) {
    setState(() {
      team.isFollowing = !team.isFollowing;
    });
    _saveFollowingTeams();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavteamsCubit, FavteamsState>(
      builder: (context, state) {
        if (state is FavteamsError) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        }
        if (state is FavteamsLoaded) {
          // إضافة الفرق من الـ Cubit إلى القائمة
          if (teams.isEmpty) {
            teams.addAll(state.teams);
          }
          return Scaffold(
            backgroundColor: const Color(0xff353535),
            body: Column(
              children: [
                // Header Section
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/background_fav_team.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FOLLOW YOUR\nFAVORITE TEAMS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Get news, game updates highlights and more\ninfo on your favorite teams',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: teams.length,
                    itemBuilder: (context, index) {
                      final team = teams[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8.0),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: team.logoPath,
                              height: 50,
                              width: 50,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              team.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.1,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => toggleFollow(team),
                              child: Container(
                                height: 35,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      team.isFollowing
                                          ? Icons.check
                                          : Icons.add,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      team.isFollowing ? 'FOLLOWING' : 'FOLLOW',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.bottomNavBar);
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff00A3B7),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Center(
                        child: Text(
                          'Let’s Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
