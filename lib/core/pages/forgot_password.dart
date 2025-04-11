import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/cubit/auth_cubit.dart';
import 'package:bookia_store/core/extentions/extentions.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/pages/log_in_page.dart';
import 'package:bookia_store/core/pages/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LogInPage()),
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
              Text("Forgot Password..?", style: TextStyle(fontSize: 30)),
              Gap(10),
              Text(
                "Don't worry! it happens..Please enter the Email address linked to your account",
                style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
              ),
              Gap(20),
              TextFormField(
                controller: cubit.emailController,
                decoration: InputDecoration(hintText: "Enter Your Email"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Email';
                  } else if (!isEmailValid(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              // EmailTextfield(),
              Gap(30),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OtpVerification()),
                  );
                },
                text: "Send Code",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Remember your password ?", style: TextStyle(fontSize: 15)),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LogInPage()),
                  );
                },
                child: Text(
                  "Log in Now",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
