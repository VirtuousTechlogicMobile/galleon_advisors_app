import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/dimens.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static String get defaultFontFamily => 'SF-Pro';
  static double get defaultFontHeight => 1.2;

  ThemeData getLightThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ColorValues.primaryGreenColor,
      iconTheme: const IconThemeData(color: ColorValues.lightGrayColor),
      scaffoldBackgroundColor: ColorValues.appBgColor,
      appBarTheme: const AppBarTheme(backgroundColor: ColorValues.lightBgColor),
      cardColor: ColorValues.lightDialogColor,
      shadowColor: ColorValues.shadowColor.withAlpha(12),
      cardTheme: const CardTheme(color: ColorValues.lightDialogColor),
      dialogTheme: const DialogTheme(backgroundColor: ColorValues.lightDialogColor),
      dialogBackgroundColor: ColorValues.lightDialogColor,
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: ColorValues.lightDialogColor,
        surfaceTintColor: ColorValues.lightDialogColor,
        modalBackgroundColor: ColorValues.lightDialogColor,
        modalBarrierColor: ColorValues.blackColor.withOpacity(0.5),
      ),
      dividerColor: ColorValues.lightDividerColor,
      disabledColor: ColorValues.lightGrayColor,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: ColorValues.darkBgColor,
        contentTextStyle: AppStyles.style14Normal.copyWith(
          color: ColorValues.darkBodyTextColor,
        ),
        actionTextColor: ColorValues.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          backgroundColor: WidgetStateProperty.all(ColorValues.primaryColor),
          foregroundColor: WidgetStateProperty.all(ColorValues.whiteColor),
          elevation: WidgetStateProperty.all(0.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: Dimens.edgeInsets16,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).height,
        ),
        labelStyle: AppStyles.p.copyWith(
          color: ColorValues.lightBodyTextColor,
        ),
        floatingLabelStyle: AppStyles.p.copyWith(
          color: ColorValues.lightBodyTextColor.withAlpha(140),
        ),
        hintStyle: AppStyles.p.copyWith(
          color: ColorValues.lightBodyTextColor.withAlpha(140),
        ),
        errorStyle: AppStyles.p.copyWith(
          color: ColorValues.errorColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.lightDividerColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.lightDividerColor.withAlpha(20),
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.lightDividerColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.primaryColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.errorColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.errorColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
      ),
      fontFamily: defaultFontFamily,
      textTheme: const TextTheme().copyWith(
        titleLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.sixTeen,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        titleMedium: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.sixTeen,
          fontWeight: FontWeight.w600,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        titleSmall: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.sixTeen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        bodyLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.twentyEight,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        bodyMedium: TextStyle(fontSize: Dimens.fourteen, fontWeight: FontWeight.w600, fontFamily: defaultFontFamily, height: defaultFontHeight, color: ColorValues.blackColor),
        bodySmall: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.fourteen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        displayLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.twentyFour,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        displayMedium: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.twenty,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        displaySmall: TextStyle(
          fontSize: Dimens.thirteen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
          color: ColorValues.blackColor,
        ),
        headlineLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.thirtyTwo,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        headlineMedium: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.twenty,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        headlineSmall: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.nineteen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        labelLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.eighteen,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        labelMedium: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.eighteen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        labelSmall: TextStyle(
          fontSize: Dimens.twelve,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
          color: ColorValues.blackColor,
        ),
      ),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData getDarkThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ColorValues.primaryGreenColor,
      iconTheme: const IconThemeData(color: ColorValues.darkGrayColor),
      scaffoldBackgroundColor: ColorValues.appBgColor,
      shadowColor: ColorValues.shadowColor.withAlpha(12),
      appBarTheme: const AppBarTheme(backgroundColor: ColorValues.darkBgColor),
      cardColor: ColorValues.darkDialogColor,
      cardTheme: const CardTheme(color: ColorValues.darkDialogColor),
      dialogTheme: const DialogTheme(backgroundColor: ColorValues.darkDialogColor),
      dialogBackgroundColor: ColorValues.darkDialogColor,
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: ColorValues.darkDialogColor,
        surfaceTintColor: ColorValues.darkDialogColor,
        modalBackgroundColor: ColorValues.darkDialogColor,
        modalBarrierColor: ColorValues.blackColor.withOpacity(0.5),
      ),
      dividerColor: ColorValues.darkDividerColor,
      disabledColor: ColorValues.darkGrayColor,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: ColorValues.lightBgColor,
        contentTextStyle: TextStyle(
          color: ColorValues.lightBodyTextColor,
        ),
        actionTextColor: ColorValues.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          backgroundColor: WidgetStateProperty.all(ColorValues.primaryColor),
          foregroundColor: WidgetStateProperty.all(ColorValues.whiteColor),
          elevation: WidgetStateProperty.all(0.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        contentPadding: Dimens.edgeInsets16,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width,
        ),
        labelStyle: AppStyles.p.copyWith(
          color: ColorValues.darkBodyTextColor,
        ),
        floatingLabelStyle: AppStyles.p.copyWith(
          color: ColorValues.darkBodyTextColor.withAlpha(140),
        ),
        hintStyle: AppStyles.p.copyWith(
          color: ColorValues.darkBodyTextColor.withAlpha(140),
        ),
        errorStyle: AppStyles.p.copyWith(
          color: ColorValues.errorColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.darkDividerColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.darkDividerColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.darkDividerColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.primaryColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.errorColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorValues.errorColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
      ),
      fontFamily: defaultFontFamily,
      textTheme: const TextTheme().copyWith(
        titleLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.sixTeen,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        titleMedium: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.sixTeen,
          fontWeight: FontWeight.w600,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        titleSmall: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.sixTeen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        bodyLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.twentyEight,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        bodyMedium: TextStyle(fontSize: Dimens.fourteen, fontWeight: FontWeight.w600, fontFamily: defaultFontFamily, height: defaultFontHeight, color: ColorValues.blackColor),
        bodySmall: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.fourteen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        displayLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.twentyFour,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        displayMedium: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.twenty,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        displaySmall: TextStyle(
          fontSize: Dimens.thirteen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
          color: ColorValues.blackColor,
        ),
        headlineLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.thirtyTwo,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        headlineMedium: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.twenty,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        headlineSmall: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.nineteen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        labelLarge: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.eighteen,
          fontWeight: FontWeight.w700,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        labelMedium: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.eighteen,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
        ),
        labelSmall: TextStyle(
          fontSize: Dimens.twelve,
          fontWeight: FontWeight.w400,
          fontFamily: defaultFontFamily,
          height: defaultFontHeight,
          color: ColorValues.blackColor,
        ),
      ),
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
