import 'package:flutter/material.dart';

const kPrimaryPurple = Color(0xFF4C5DF2);
const kPrimaryDarkPurple = Color(0xFF3F3E6D);
const kPrimaryWhite = Color(0xFFFFFFFF);
const kSecondaryLightPurple = Color(0xFFD0BCFF);
const kSecondaryGrey = Color(0xFF999999);
const kBackgroundWhite = Color(0xFFF9FBFC);
const kBackgorundLightgrey = Color(0xFFEFF1FF);
const kBlack = Color(0xFF322F35);
const kDanger = Color(0xFFDC362E);

const double kDefualtPadding = 24.0;

const double kAppbarHeight = 64.0;

class CustomTextStyle{

  static TextStyle heading1(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle heading2(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle heading3(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600
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