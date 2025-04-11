import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/constants/text_style.dart';
import 'package:bookia_store/core/pages/otp_verification.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OtpVerification()),
            );
          },
          icon: SvgPicture.asset(AssetManager.back),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create New Password !",
                style: getTitleStyle(
                  context,
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Gap(10),

              Text(
                "Your new password must be different from previously used passwords.",
                style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
              ),

              Gap(10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "New Password",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(AssetManager.eye),
                  ),
                ),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Password';
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              // EmailTextfield(),
              Gap(15),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(AssetManager.eye),
                  ),
                ),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Password';
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              Gap(25),
              // ObsecuredTextField(),
              CustomButton(text: 'Reset Password', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
