import 'package:bookia_store/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
              Column(
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    "Don't worry! it happens..Please enter the Email address linked to your account",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
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
              CustomButton(onPressed: () {}, text: "Send Code"),
              Gap(200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Rememberd Password?", style: TextStyle(fontSize: 15)),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Log in Now",
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
