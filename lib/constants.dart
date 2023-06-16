import 'package:flutter/material.dart';

const cPrimaryPurple = Color(0xFF4C5DF2);
const cPrimaryDarkPurple = Color(0xFF3F3E6D);
const cPrimaryWhite = Color(0xFFFFFFFF);
const cSecondaryLightPurple = Color(0xFFD0BCFF);
const cSecondaryGrey = Color(0xFF999999);
const cBackgroundWhite = Color(0xFFF9FBFC);
const cBackgorundLightgrey = Color(0xFFEFF1FF);
const cBlack = Color(0xFF322F35);
const cDanger = Color(0xFFDC362E);

const double pDefualtPadding = 24.0;

class CustomTextStyle{

  static TextStyle heading1(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500
    );
  }

  static TextStyle heading2(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500
    );
  }

  static TextStyle heading3(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500
    );
  }

  static TextStyle body1(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w400
    );
  }

  static TextStyle body2(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400
    );
  }

  static TextStyle body3(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400
    );
  }

}