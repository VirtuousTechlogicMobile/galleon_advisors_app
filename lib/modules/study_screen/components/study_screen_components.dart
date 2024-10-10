import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';

class StudyScreenComponents {
  static Widget customListElement({required String text, TextStyle? textStyle, int? maxLines}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: AppStyles.style13Normal.copyWith(color: ColorValues.blackColor),
        ).marginOnly(top: Dimens.five, right: Dimens.ten),
        Flexible(
          child: Text(
            text,
            style: textStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            maxLines: maxLines ?? 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  static void stopStudyDialog({
    required BuildContext context,
    required Function() onCompleteButtonTapped,
    required Function() whenComplete,
  }) {
    Get.dialog(
      barrierColor: ColorValues.transparent,
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - (Dimens.eighty * 2), // minus appbar and bottom bar height
          width: MediaQuery.of(context).size.width,
          child: AlertDialog(
            alignment: Alignment.topCenter,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.fifty)),
            elevation: 0,
            content: Container(
              padding: EdgeInsets.only(bottom: Dimens.twenty, top: Dimens.twentyFour, left: Dimens.twentyEight, right: Dimens.twentyEight),
              width: GetResponsiveDimens.widthDivTwoAndOnePointFive(context),
              decoration: BoxDecoration(
                border: Border.all(color: ColorValues.primaryGreenColor, width: Dimens.two),
                color: ColorValues.whiteColor,
                borderRadius: BorderRadius.circular(Dimens.twelve),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        StringValues.doYouWantToStopStudyName.tr,
                        style: AppStyles.style24Bold.copyWith(color: ColorValues.blackColor),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "${StringValues.areYouSureYouWantToStopTheStudyYouWillBeUnableToReturnToTheStudyIfYouAreReturningToTheStudyUseThePauseFunction.tr} ",
                        style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                        maxLines: 5,
                        textAlign: TextAlign.center,
                      ).marginOnly(top: Dimens.fifteen, bottom: GetResponsiveDimens.twentyAndSevenTeen(context)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomPrimaryButton(
                          btnText: StringValues.cancel.tr,
                          border: Border.all(color: ColorValues.primaryGreenColor, width: GetResponsiveDimens.threeAndTwo(context)),
                          buttonColor: ColorValues.whiteColor,
                          contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.thirteenAndFifteen(context)),
                          borderRadius: BorderRadius.circular(Dimens.twelve),
                          buttonWidth: GetResponsiveDimens.twoHundredEightyAndOneHundredSixty(context),
                          btnTextStyle: const TextStyle(fontSize: 17, color: ColorValues.primaryGreenColor, fontWeight: FontWeight.w700),
                          margin: EdgeInsets.only(right: Dimens.twenty),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        CustomPrimaryButton(
                          btnText: StringValues.complete.tr,
                          buttonColor: ColorValues.primaryGreenColor,
                          border: Border.all(color: ColorValues.primaryGreenColor, width: Dimens.three),
                          contentPadding: EdgeInsets.symmetric(vertical: Dimens.thirteen),
                          borderRadius: BorderRadius.circular(Dimens.twelve),
                          buttonWidth: GetResponsiveDimens.twoHundredEightyAndOneHundredSixty(context),
                          btnTextStyle: const TextStyle(fontSize: 17, color: ColorValues.whiteColor, fontWeight: FontWeight.w700),
                          margin: EdgeInsets.only(left: Dimens.twenty),
                          onTap: () => onCompleteButtonTapped(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ).marginOnly(top: Dimens.twentySix),
        ),
      ),
      transitionCurve: Curves.linear,
      barrierDismissible: false,
    ).whenComplete(
      () {
        whenComplete();
      },
    );
  }
}
