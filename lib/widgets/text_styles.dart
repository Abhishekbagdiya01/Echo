import 'package:echo/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle interTextStyle({
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
}) {
  return TextStyle(
      fontFamily: "Inter",
      fontSize: fontSize,
      color: color ?? blackColor,
      fontWeight: fontWeight);
}
