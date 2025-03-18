import 'package:bookia_store/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              child: Text(
                "Hello! Register to get started,,!",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Gap(20),
            TextFormField(
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 234, 232, 232),
                filled: true,
                hintText: "Username",
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Gap(10),
            TextFormField(
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 234, 232, 232),
                filled: true,
                hintText: "Email",
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Gap(10),
            TextFormField(
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 234, 232, 232),
                filled: true,
                suffixIcon: SvgPicture.asset("assets/images/eye.svg"),
                hintText: "Enter Your Password",
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Gap(10),
            TextFormField(
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 234, 232, 232),
                filled: true,
                suffixIcon: SvgPicture.asset("assets/images/eye.svg"),
                hintText: "Confirm password",
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Gap(20),
            CustomButton(onPressed: () {}, text: "Register"),
            Gap(150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ?",
                  style: TextStyle(fontSize: 14),
                ),
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
    );
  }
}
