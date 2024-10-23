import 'package:flutter/material.dart';
import '../constant/colors.dart';

class GetThemeWiseColor {
  final bool isDarkMode;
  GetThemeWiseColor(BuildContext context) : isDarkMode = Theme.of(context).brightness == Brightness.dark;

  Color get whiteColor => isDarkMode ? ColorValues.whiteColor : ColorValues.blackColor;

  Color get blackColor => isDarkMode ? ColorValues.blackColor : ColorValues.blackColor;

  Color get primaryGreenColor => isDarkMode ? ColorValues.primaryGreenColor : ColorValues.primaryGreenColor;

  Color get buttonTextColor => isDarkMode ? ColorValues.whiteColor : ColorValues.whiteColor;
}

class GetThemeStyles {
  static TextStyle? getStyle12Normal(BuildContext context) => Theme.of(context).textTheme.labelSmall;
  static TextStyle? getStyle13Normal(BuildContext context) => Theme.of(context).textTheme.displaySmall;
  static TextStyle? getStyle14SemiBold(BuildContext context) => Theme.of(context).textTheme.bodyMedium;
  static TextStyle? getStyle14Normal(BuildContext context) => Theme.of(context).textTheme.bodySmall;
  static TextStyle? getStyle16Bold(BuildContext context) => Theme.of(context).textTheme.titleLarge;
  static TextStyle? getStyle16Normal(BuildContext context) => Theme.of(context).textTheme.titleSmall;
  static TextStyle? getStyle16SemiBold(BuildContext context) => Theme.of(context).textTheme.titleMedium;
  static TextStyle? getStyle18Bold(BuildContext context) => Theme.of(context).textTheme.labelLarge;
  static TextStyle? getStyle18Normal(BuildContext context) => Theme.of(context).textTheme.labelMedium;
  static TextStyle? getStyle19Normal(BuildContext context) => Theme.of(context).textTheme.headlineSmall;
  static TextStyle? getStyle20Bold(BuildContext context) => Theme.of(context).textTheme.headlineMedium;
  static TextStyle? getStyle20Normal(BuildContext context) => Theme.of(context).textTheme.displayMedium;
  static TextStyle? getStyle24Bold(BuildContext context) => Theme.of(context).textTheme.displayLarge;
  static TextStyle? getStyle28Bold(BuildContext context) => Theme.of(context).textTheme.bodyLarge;
  static TextStyle? getStyle32Bold(BuildContext context) => Theme.of(context).textTheme.headlineLarge;
}
