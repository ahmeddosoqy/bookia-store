import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/text_style.dart';
import 'package:bookia_store/custom_button.dart';
import 'package:bookia_store/forgot_password.dart';
import 'package:bookia_store/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
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
              Gap(20),
              TextFormField(
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 234, 232, 232),
                  filled: true,
                  hintText: "Enter Your Email",
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Gap(20),
              TextFormField(
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.start,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 234, 232, 232),
                  filled: true,
                  suffixIcon: SvgPicture.asset(AssetManager.eye),
                  hintText: "Enter Your Password",
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Gap(20),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 130),
                    child: Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Your Password ?",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20),
              CustomButton(
                text: 'Log in',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInPage()),
                  );
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
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(15),
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(AssetManager.facebook),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(15),
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(AssetManager.google),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(AssetManager.apple),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(fontSize: 15),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(color: Colors.blue),
                    ),
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
