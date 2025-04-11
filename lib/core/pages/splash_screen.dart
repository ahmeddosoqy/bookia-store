import 'dart:developer';

import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/extentions/extentions.dart';
import 'package:bookia_store/core/pages/main_app_screen.dart';
import 'package:bookia_store/core/pages/welcome_page.dart';
import 'package:bookia_store/core/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    String? token = AppLocalStorage.getCachedData(AppLocalStorage.tokenKey);
    log(token.toString());
    Future.delayed(Duration(seconds: 3), () {
      if (token != null) {
        context.pushReplacement(MainAppScreen());
      } else {
        context.pushReplacement(WelcomePage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Lottie.asset(AssetManager.splashscreen)],
        )),
      ),
    );
  }
}
