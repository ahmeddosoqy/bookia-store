import 'package:bookia_store/core/constants/themes.dart';
import 'package:bookia_store/core/cubit/auth_cubit.dart';
import 'package:bookia_store/core/services/dio_provider.dart';
import 'package:bookia_store/core/pages/splash_screen.dart';
import 'package:bookia_store/core/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await AppLocalStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AuthCubit();
      },
      child: MaterialApp(
        theme: AppTheme.appTheme(),
        debugShowCheckedModeBanner: false,

        home: SplashScreen(),
      ),
    );
  }
}

// pc token
// 7170|WJunqGCZT9IOcDlAAOBoyZ6hPDFPDmguv4skGsFq
//
//lapop token
// 6640|XO9LU92xhYHl6WRTDdTOeEP0G6VMrrfczG1tm3Nn
