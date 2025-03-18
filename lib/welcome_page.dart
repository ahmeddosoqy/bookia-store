import 'package:bookia_store/core/app_colors.dart';
import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/custom_button.dart';
import 'package:bookia_store/log_in_page.dart';
import 'package:bookia_store/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetManager.background),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SvgPicture.asset(AssetManager.logo)],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    "Order Your Book Now!",
                    style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
                  ),
                  SizedBox(height: 300),
                  CustomButton(
                    text: 'Log in',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInPage()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: 'Register',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
