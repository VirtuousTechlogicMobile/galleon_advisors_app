import 'package:galleon_user/constant/dimens.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle style12Normal = TextStyle(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style13Normal = TextStyle(
    fontSize: Dimens.thirteen,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style14SemiBold = TextStyle(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style14Normal = TextStyle(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style16Bold = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style16Normal = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style16SemiBold = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w600,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style18Bold = TextStyle(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style18Normal = TextStyle(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style19Normal = TextStyle(
    fontSize: Dimens.nineteen,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style20Bold = TextStyle(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style20Normal = TextStyle(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style24Bold = TextStyle(
    fontSize: Dimens.twentyFour,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style28Bold = TextStyle(
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static TextStyle style32Bold = TextStyle(
    fontSize: Dimens.thirtyTwo,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
    height: defaultFontHeight,
  );

  static String get defaultFontFamily => 'SF-Pro';

  static double get defaultFontHeight => 1.2;

  /// Text Styles

  static TextStyle get p => TextStyle(
        fontSize: Dimens.fourteen,
        fontWeight: FontWeight.w300,
        fontFamily: defaultFontFamily,
        height: defaultFontHeight,
      );
}
