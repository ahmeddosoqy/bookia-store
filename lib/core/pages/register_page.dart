import 'dart:developer';
import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/cubit/auth_cubit.dart';
import 'package:bookia_store/core/cubit/auth_states.dart';
import 'package:bookia_store/core/extentions/extentions.dart';
import 'package:bookia_store/core/model/request/auth_params.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/pages/log_in_page.dart';
import 'package:bookia_store/core/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              MaterialPageRoute(builder: (context) => LogInPage()),
            );
          },
          icon: SvgPicture.asset(AssetManager.back),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pop(context);
            log("success");
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorToast(context, state.error);
          } else if (state is AuthLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (BuildContext context, AuthStates state) {
          var cubit = context.read<AuthCubit>();
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey1,
                child: Column(
                  children: [
                    SizedBox(
                      child: Text(
                        "Hello! Register to get started,,!",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                    Gap(20),
                    TextFormField(
                      controller: cubit.nameController,
                      decoration: InputDecoration(hintText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Username';
                        }
                        return null;
                      },
                    ),
                    // Usertextfield(),
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
                    // EmailTextfield(validator: (value) {}),
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
                    Gap(10),
                    TextFormField(
                      controller: cubit.passwordConfirmationController,
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
                          return 'Please confirm Password';
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    // ObsecuredTextField(),
                    Gap(20),
                    CustomButton(
                      text: "Register",
                      onPressed: () {
                        if (cubit.formKey1.currentState!.validate()) {
                          cubit.register(
                            AuthParams(
                              name: cubit.nameController.text,
                              email: cubit.emailController.text,
                              password: cubit.passwordController.text,
                              passwordConfirmation:
                                  cubit.passwordConfirmationController.text,
                            ),
                          );
                        }
                      },
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
              Text("Already have an account ?", style: TextStyle(fontSize: 15)),
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
