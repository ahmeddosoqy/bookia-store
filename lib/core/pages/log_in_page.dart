import 'dart:developer';

import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/constants/text_style.dart';
import 'package:bookia_store/core/cubit/auth_cubit.dart';
import 'package:bookia_store/core/cubit/auth_states.dart';
import 'package:bookia_store/core/extentions/extentions.dart';
import 'package:bookia_store/core/model/request/auth_params.dart';
import 'package:bookia_store/core/pages/main_app_screen.dart';
import 'package:bookia_store/core/pages/welcome_page.dart';
import 'package:bookia_store/core/widgets/dialogs.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/pages/forgot_password.dart';
import 'package:bookia_store/core/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomePage()),
            );
          },
          icon: SvgPicture.asset(AssetManager.back),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            context.pushAndRemoveUntil(MainAppScreen());
            log("success");
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorToast(context, state.error);
          } else if (state is AuthLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (BuildContext context, state) {
          var cubit = context.read<AuthCubit>();
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        "Welcome back! Glad to see you Again!",
                        style: getTitleStyle(
                          context,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Gap(10),
                    TextFormField(
                      controller: cubit.emailController,
                      decoration: InputDecoration(hintText: "Email"),
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
                    Gap(10),
                    TextFormField(
                      controller: cubit.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
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
                    // ObsecuredTextField(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 130),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot Your Password ?",
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      text: 'Log in',
                      onPressed: () {
                        if (cubit.formKey2.currentState!.validate()) {
                          cubit.login(
                            AuthParams(
                              email: cubit.emailController.text,
                              password: cubit.passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Divider(color: Colors.black, height: 66),
                          ),
                        ),
                        Text("Or Log in With"),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Divider(color: Colors.black, height: 66),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(8),
                            height: 50,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(AssetManager.facebook),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(8),
                            height: 50,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(AssetManager.google),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: 50,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(AssetManager.apple),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account ?", style: TextStyle(fontSize: 15)),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  "Register Now",
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
