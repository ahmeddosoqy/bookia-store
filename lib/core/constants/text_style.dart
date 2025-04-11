import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle getTitleStyle(
  BuildContext context, {
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    color: color ?? AppColors.darkColor,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyStyle(
  context, {
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    color: color ?? AppColors.darkColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getSmallStyle(
  BuildContext context, {
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    color: color ?? AppColors.darkColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
