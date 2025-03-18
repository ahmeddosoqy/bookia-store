import 'package:bookia_store/core/app_colors.dart';
import 'package:bookia_store/core/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });
  final String text;
  final Function() onPressed;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width ?? 320,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        child: Text(
          text,
          style: getTitleStyle(
            context,
            color: AppColors.whiteColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
