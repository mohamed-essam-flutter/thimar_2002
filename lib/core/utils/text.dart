import 'package:flutter/material.dart';
import 'package:t7mara/core/utils/colors.dart';

TextStyle getHeadlineTextStyle(
    {double fontSize = 16, fontWeight = FontWeight.bold, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? ColorApp.primary,
  );
}

// title

TextStyle getTitleStyle(
    {double fontSize = 16, fontWeight = FontWeight.bold, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? ColorApp.primary,
  );
}

TextStyle getbodyStyle(
    {double fontSize = 14, fontWeight = FontWeight.normal, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? ColorApp.primary,
  );
}
// small

TextStyle getSmallStyle(
    {double fontSize = 10, fontWeight = FontWeight.normal, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? ColorApp.primary,
  );
}
