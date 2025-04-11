import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/extentions/extentions.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/pages/log_in_page.dart';
import 'package:bookia_store/core/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetManager.background,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          Positioned(
            top: 0,
            right: 22,
            left: 22,
            bottom: 0,
            child: Column(
              children: [
                Spacer(flex: 1),
                SvgPicture.asset(AssetManager.logo),

                Text(
                  "Order Your Book Now!",
                  style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
                ),
                Spacer(flex: 4),
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
                    context.pushTo(RegisterPage());
                  },
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
