import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  });
  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        child: Text(
          text,
          style: getTitleStyle(
            context,
            color: AppColors.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
