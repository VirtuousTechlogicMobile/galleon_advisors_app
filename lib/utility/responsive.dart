import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/constant/styles.dart';

import '../constant/dimens.dart';

class Responsive {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;
}

class GetResponsiveFontSize {
  static TextStyle getStyle20And18Normal(BuildContext context) => Responsive.isMobile(context) ? AppStyles.style20Normal : AppStyles.style18Normal;
  static TextStyle getStyle19And18Normal(BuildContext context) => Responsive.isMobile(context) ? AppStyles.style19Normal : AppStyles.style18Normal;
  static TextStyle getStyle14And16SemiBold(BuildContext context) => Responsive.isMobile(context) ? AppStyles.style14SemiBold : AppStyles.style16SemiBold;
}

class GetResponsiveDimens {
  static double sixteenAndFourteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.sixTeen : Dimens.fourteen;
  static double tenAndEight(BuildContext context) => Responsive.isMobile(context) ? Dimens.ten : Dimens.eight;
  static double nineAndEight(BuildContext context) => Responsive.isMobile(context) ? Dimens.nine : Dimens.eight;
  static double fiveAndSeven(BuildContext context) => Responsive.isMobile(context) ? Dimens.five : Dimens.seven;
  static double sevenAndNine(BuildContext context) => Responsive.isMobile(context) ? Dimens.seven : Dimens.nine;
  static double eightAndZero(BuildContext context) => Responsive.isMobile(context) ? Dimens.ten : Dimens.zero;
  static double thirtyAndTwentyEight(BuildContext context) => Responsive.isMobile(context) ? Dimens.thirty : Dimens.twentyEight;
  static double eightyAndSixty(BuildContext context) => Responsive.isMobile(context) ? Dimens.eighty : Dimens.sixty;
  static double twentyAndFourteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.twenty : Dimens.fourteen;
  static double fortyThreeAndSeventy(BuildContext context) => Responsive.isMobile(context) ? Dimens.seventy : Dimens.fortyThree;
  static double thirtyTwoAndThirtyThree(BuildContext context) => Responsive.isMobile(context) ? Dimens.thirtyTwo : Dimens.thirtyThree;
  static double sixtyAndThirtyFive(BuildContext context) => Responsive.isMobile(context) ? Dimens.sixty : Dimens.thirtyFive;
  static double seventyFiveAndOneHundredFifty(BuildContext context) => Responsive.isMobile(context) ? Dimens.oneHundredFifty : Dimens.seventyFive;
  static double twentyNineAndFifty(BuildContext context) => Responsive.isMobile(context) ? Dimens.fifty : Dimens.twentyNine;
  static double sixAndFour(BuildContext context) => Responsive.isMobile(context) ? Dimens.six : Dimens.four;
  static double ninetyAndSixty(BuildContext context) => Responsive.isMobile(context) ? Dimens.ninety : Dimens.sixty;
  static double twentyFiveAndTwentyOne(BuildContext context) => Responsive.isMobile(context) ? Dimens.twentyFive : Dimens.twentyOne;
  static double widthDivThreeAndTwoHundredForty(BuildContext context) => Responsive.isMobile(context) ? Dimens.screenWidth / 3.5 : Dimens.twoHundredForty;
  static double widthDivFourAndTwoHundredForty(BuildContext context) => Responsive.isMobile(context) ? Dimens.screenWidth / 4.2 : Dimens.twoHundredForty;
}
