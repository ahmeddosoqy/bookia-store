import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.greyColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.greyColor, width: 1),
        ),
        hintStyle: TextStyle(fontSize: 13, color: AppColors.darkGrey),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.greyColor, width: 1),
        ),
        suffixIconConstraints: BoxConstraints(minHeight: 25, minWidth: 25),
      ),
      fontFamily: "DmSerifDisplay",
    );
  }
}

// static ThemeData lightTheme = ThemeData(
//   appBarTheme: AppBarTheme(
//     backgroundColor: AppColors.whiteColor,
//     titleTextStyle: TextStyle(color: AppColors.darkColor),
//   ),
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: AppColors.primaryColor,
//     onSurface: AppColors.darkColor,
//   ),
//   scaffoldBackgroundColor: AppColors.whiteColor,
//   inputDecorationTheme: InputDecorationTheme(
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: BorderSide(width: 3.0, color: AppColors.darkColor),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: BorderSide(width: 3.0, color: AppColors.darkColor),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: BorderSide(width: 3.0, color: AppColors.darkColor),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: BorderSide(width: 3.0, color: AppColors.darkColor),
//     ),
//   ),
// );
// static ThemeData darkTheme = ThemeData(
//   appBarTheme: AppBarTheme(
//     backgroundColor: AppColors.darkColor,
//     titleTextStyle: TextStyle(color: AppColors.whiteColor),
//   ),
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: AppColors.primaryColor,
//     onSurface: AppColors.whiteColor,
//   ),

//   scaffoldBackgroundColor: AppColors.darkColor,
//   inputDecorationTheme: InputDecorationTheme(
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: BorderSide(width: 3.0, color: AppColors.primaryColor),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: BorderSide(width: 3.0, color: AppColors.primaryColor),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: BorderSide(width: 3.0, color: AppColors.darkColor),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: BorderSide(width: 3.0, color: AppColors.darkColor),
//     ),
//   ),
// );
