import 'package:flutter/material.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:get/get.dart';

import '../constant/dimens.dart';

class Responsive {
  static bool isMobile(BuildContext context) => Get.width < 900 /*850*/;

  static bool isTablet(BuildContext context) => Get.width < 1100 && Get.width >= 900 /*850*/;

  static bool isDesktop(BuildContext context) => Get.width >= 1100;
}

class GetResponsiveFontStyle {
  static TextStyle getStyle20And18Normal(BuildContext context) => Responsive.isMobile(context) ? AppStyles.style20Normal : AppStyles.style18Normal;
  static TextStyle getStyle19And18Normal(BuildContext context) => Responsive.isMobile(context) ? AppStyles.style19Normal : AppStyles.style18Normal;
  static TextStyle getStyle14And16SemiBold(BuildContext context) => Responsive.isMobile(context) ? AppStyles.style14SemiBold : AppStyles.style16SemiBold;
  static TextStyle getStyle20And18Bold(BuildContext context) => Responsive.isMobile(context) ? AppStyles.style20Bold : AppStyles.style18Bold;
}

class GetResponsiveDimens {
  static double getAppBarHeight(BuildContext context) => Responsive.isMobile(context) ? 50 : Dimens.fifty;
  static double? getBottomBarButtonHeight(BuildContext context) => Responsive.isMobile(context) ? 70 : null;
  static double sixteenAndFourteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.sixTeen : Dimens.fourteen;
  static double zeroAndThree(BuildContext context) => Responsive.isMobile(context) ? Dimens.zero : Dimens.three;
  static double zeroAndSix(BuildContext context) => Responsive.isMobile(context) ? Dimens.zero : Dimens.six;
  static double tenAndEight(BuildContext context) => Responsive.isMobile(context) ? Dimens.ten : Dimens.eight;
  static double tenAndZero(BuildContext context) => Responsive.isMobile(context) ? Dimens.ten : Dimens.zero;
  static double twelveAndEight(BuildContext context) => Responsive.isMobile(context) ? Dimens.twelve : Dimens.eight;
  static double fifteenAndThirteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.fifteen : Dimens.thirteen;
  static double fifteenAndFourteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.fifteen : Dimens.fourteen;
  static double fourteenAndThirteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.fourteen : Dimens.thirteen;
  static double fifteenAndEight(BuildContext context) => Responsive.isMobile(context) ? Dimens.fifteen : Dimens.eight;
  static double threeAndTwo(BuildContext context) => Responsive.isMobile(context) ? Dimens.three : Dimens.two;
  static double nineAndEight(BuildContext context) => Responsive.isMobile(context) ? Dimens.nine : Dimens.eight;
  static double nineAndSeven(BuildContext context) => Responsive.isMobile(context) ? Dimens.nine : Dimens.seven;
  static double nineAndFive(BuildContext context) => Responsive.isMobile(context) ? Dimens.nine : Dimens.five;
  static double fiveAndSeven(BuildContext context) => Responsive.isMobile(context) ? Dimens.five : Dimens.seven;
  static double fourAndSeven(BuildContext context) => Responsive.isMobile(context) ? Dimens.four : Dimens.seven;
  static double sevenAndFive(BuildContext context) => Responsive.isMobile(context) ? Dimens.seven : Dimens.five;
  static double sevenAndNine(BuildContext context) => Responsive.isMobile(context) ? Dimens.seven : Dimens.nine;
  static double fiveAndNine(BuildContext context) => Responsive.isMobile(context) ? Dimens.five : Dimens.nine;
  static double eightAndZero(BuildContext context) => Responsive.isMobile(context) ? Dimens.eight : Dimens.zero;
  static double eightAndSix(BuildContext context) => Responsive.isMobile(context) ? Dimens.eight : Dimens.six;
  static double elevenAndNine(BuildContext context) => Responsive.isMobile(context) ? Dimens.eleven : Dimens.nine;
  static double sixteenAndSix(BuildContext context) => Responsive.isMobile(context) ? Dimens.sixTeen : Dimens.eight;
  static double fiftyAndTwentyTwo(BuildContext context) => Responsive.isMobile(context) ? Dimens.fifty : Dimens.twentyTwo;
  static double fiftyTwoAndTwentyThree(BuildContext context) => Responsive.isMobile(context) ? Dimens.fiftyTwo : Dimens.twentyThree;
  static double fiftyFiveAndTwentyThree(BuildContext context) => Responsive.isMobile(context) ? Dimens.fiftyFive : Dimens.twentyFour;
  static double sixAndThree(BuildContext context) => Responsive.isMobile(context) ? Dimens.six : Dimens.three;
  static double sevenAndTen(BuildContext context) => Responsive.isMobile(context) ? Dimens.seven : Dimens.ten;
  static double thirtyAndTwentySix(BuildContext context) => Responsive.isMobile(context) ? Dimens.thirty : Dimens.twentySix;
  static double thirtyAndTwentyEight(BuildContext context) => Responsive.isMobile(context) ? Dimens.thirty : Dimens.twentyEight;
  static double eightyAndSixty(BuildContext context) => Responsive.isMobile(context) ? Dimens.eighty : Dimens.sixty;
  static double twentyAndFourteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.twenty : Dimens.fourteen;
  static double fortyThreeAndSeventy(BuildContext context) => Responsive.isMobile(context) ? Dimens.seventy : Dimens.fortyThree;
  static double fortyAndSevenTeen(BuildContext context) => Responsive.isMobile(context) ? Dimens.forty : Dimens.sevenTeen;
  static double thirtyTwoAndThirtyThree(BuildContext context) => Responsive.isMobile(context) ? Dimens.thirtyTwo : Dimens.thirtyThree;
  static double sixtyAndThirtyFive(BuildContext context) => Responsive.isMobile(context) ? Dimens.sixty : Dimens.thirtyFive;
  static double sixtyAndForty(BuildContext context) => Responsive.isMobile(context) ? Dimens.sixty : Dimens.forty;
  static double eightyAndThirtyFive(BuildContext context) => Responsive.isMobile(context) ? Dimens.eighty : Dimens.thirtyFive;
  static double seventyFiveAndOneHundredFifty(BuildContext context) => Responsive.isMobile(context) ? Dimens.oneHundredFifty : Dimens.seventyFive;
  static double threeHundredFiftyAndOneHundredFifty(BuildContext context) => Responsive.isMobile(context) ? Dimens.threeHundredFifty : Dimens.oneHundredFifty;
  static double twentyNineAndFifty(BuildContext context) => Responsive.isMobile(context) ? Dimens.fifty : Dimens.twentyNine;
  static double hundredAndFifty(BuildContext context) => Responsive.isMobile(context) ? Dimens.hundred : Dimens.fifty;
  static double eightyAndFortySix(BuildContext context) => Responsive.isMobile(context) ? Dimens.eighty : Dimens.fortySix;
  static double sixAndFour(BuildContext context) => Responsive.isMobile(context) ? Dimens.six : Dimens.four;
  static double ninetyAndSixty(BuildContext context) => Responsive.isMobile(context) ? Dimens.ninetyFive : Dimens.sixty;
  static double thirteenAndFifteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.thirteen : Dimens.fifteen;
  static double twentyAndSevenTeen(BuildContext context) => Responsive.isMobile(context) ? Dimens.twenty : Dimens.sevenTeen;
  static double hundredTenAndFiftyOne(BuildContext context) => Responsive.isMobile(context) ? Dimens.oneHundredTen : Dimens.fiftyOne;
  static double twentyFiveAndTwentyOne(BuildContext context) => Responsive.isMobile(context) ? Dimens.twentyFive : Dimens.twentyOne;
  static double eightyAndEighteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.eighty : Dimens.eighteen;
  static double thirtySixAndEighteen(BuildContext context) => Responsive.isMobile(context) ? Dimens.thirtySix : Dimens.eighteen;
  static double fiftyEightAndTwentySix(BuildContext context) => Responsive.isMobile(context) ? Dimens.fiftyEight : Dimens.twentySix;
  static double fiftyFiveAndTwentyFour(BuildContext context) => Responsive.isMobile(context) ? Dimens.fiftyFive : Dimens.twentyFour;
  static double oneHundredTwentyAndFiftySix(BuildContext context) => Responsive.isMobile(context) ? Dimens.oneHundredTwenty : Dimens.fiftySix;
  static double twoHundredEightyAndOneHundredFortyOne(BuildContext context) => Responsive.isMobile(context) ? Dimens.twoHundredEighty : Dimens.oneHundredFortyOne;
  static double twoHundredEightyAndOneHundredForty(BuildContext context) => Responsive.isMobile(context) ? Dimens.twoHundredEighty : Dimens.oneHundredForty;
  static double widthDivThreeAndTwoHundredForty(BuildContext context) => Responsive.isMobile(context) ? Get.width / 3.5 : Dimens.twoHundredForty;
  static double widthDivFourAndTwoHundredForty(BuildContext context) => Responsive.isMobile(context) ? Get.width / 4 : Dimens.twoHundredForty;
  static double widthDivFiveAndTwoHundredForty(BuildContext context) => Responsive.isMobile(context) ? Get.width / 5 : Dimens.twoHundredForty;
  static double widthDivTwoAndOnePointFive(BuildContext context) => Responsive.isMobile(context) ? Get.width / 1.5 : Get.width / 2;
  static double widthDivTwoAndTwoPointEight(BuildContext context) => Responsive.isMobile(context) ? Get.width / 2 : Get.width / 2.8;
  static double heightDivTwoAndThreePointThree(BuildContext context) => Responsive.isMobile(context) ? Dimens.screenHeight / 2 : Dimens.screenHeight / 3.3;
  static double widthDivTwoPointFiveAndThreePointThree(BuildContext context) => Responsive.isMobile(context) ? Get.width / 2.5 : Get.width / 3.3;
  static double? widthDivTheePointFive(BuildContext context) => Responsive.isMobile(context) ? null : Get.width / 3.5;
}

class GetResponsiveFlex {
  static int threeAndOne(BuildContext context) => Responsive.isMobile(context) ? 3 : 1;
  static int twoAndOne(BuildContext context) => Responsive.isMobile(context) ? 2 : 1;
  static int fourAndTwo(BuildContext context) => Responsive.isMobile(context) ? 4 : 2;
  static int threeAndTwo(BuildContext context) => Responsive.isMobile(context) ? 3 : 2;
  static int fourAndThree(BuildContext context) => Responsive.isMobile(context) ? 4 : 3;
}
