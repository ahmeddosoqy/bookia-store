import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/welcome_page.dart';
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
    Future.delayed(Duration(seconds: 3), () {
      context.pushReplacement(WelcomePage());
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

extension Navigation on BuildContext {
  pushTo(Widget widget) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => widget));
  }

  pushReplacement(Widget widget) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
