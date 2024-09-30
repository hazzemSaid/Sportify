import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify/core/utils/routes/routes.dart';
import 'package:sportify/features/AuthFeatures/presentation/viewmodel/auth_bloc/auth_cubit.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/screens/splash_screen.dart';
import 'package:sportify/features/home/presentation/viewmodel/standing_cubit.dart';
import 'package:sportify/firebase_options.dart';

import 'core/utils/api/Api.dart';
import 'features/home/data/repo/homerepoImp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
          )..getStandingByLeague(league: "PL", season: '2024', matchDay: 6),
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
  }
}
