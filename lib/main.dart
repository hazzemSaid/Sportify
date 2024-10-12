import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify/core/utils/routes/routes.dart';
import 'package:sportify/features/AuthFeatures/presentation/viewmodel/auth_bloc/auth_cubit.dart';
import 'package:sportify/features/Explore_news/data/repo/explore_repo_impo.dart';
import 'package:sportify/features/Explore_news/presentation/viewmodel/news_cubit.dart';
import 'package:sportify/features/Fav_teams/data/repo/favteamrepoimp.dart';
import 'package:sportify/features/Fav_teams/presentation/viewmodel/favteams_cubit.dart';
import 'package:sportify/features/Home/presentation/viewmodel/match_day/match_day_cubit.dart';
import 'package:sportify/features/Home/presentation/viewmodel/standing_cubit/standing_cubit.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/screens/splash_screen.dart';
import 'package:sportify/features/match_Fixtures/data/repo/match_fixtures_impo.dart';
import 'package:sportify/features/match_Fixtures/data/upcoming/upcoming_cubit.dart';
import 'package:sportify/features/match_Fixtures/presentation/viewmodel/finishedmatches/match_fixtures_cubit.dart';
import 'package:sportify/firebase_options.dart';

import 'core/utils/api/Api.dart';
import 'features/Home/data/repo/homerepoImp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<StandingCubit>(
          create: (context) => StandingCubit(
            Homerepoimp(
              Api(
                Dio(
                    //next we solve the injection problem by using the get_it package

                    ),
              ),
            ),
          )..getStandingByLeague(league: "PL", season: '2024', matchDay: 32),
        ),
        BlocProvider<MatchDayCubit>(
            create: (context) => MatchDayCubit(
                  Homerepoimp(
                    Api(
                      Dio(
                          //next we solve the injection problem by using the get_it package

                          ),
                    ),
                  ),
                )),
        BlocProvider<MatchFixturesCubit>(
          create: (context) => MatchFixturesCubit(
            MatchFixturesImpo(
              Api(
                Dio(
                    //next we solve the injection problem by using the get_it package

                    ),
              ),
            ),
          ),
        ),
        BlocProvider<UpcomingCubit>(
          create: (context) => UpcomingCubit(
            MatchFixturesImpo(
              Api(
                Dio(
                    //next we solve the injection problem by using the get_it package

                    ),
              ),
            ),
          ),
        ),
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit(ExploreRepoImpo(
            Api(
              Dio(
                  //next we solve the injection problem by using the get_it package

                  ),
            ),
          )),
        ),
        BlocProvider<FavteamsCubit>(
          create: (context) => FavteamsCubit(
            repo: Favteamrepoimp(
              api: Api(
                Dio(),
              ),
            ),
          ),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: AppRoutes.splash,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.generateRoute,
        home: const SplashScreen(),
      ),
    );
    //01224661310
  }
}
