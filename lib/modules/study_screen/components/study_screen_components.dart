import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';

class StudyScreenComponents {
  static Widget customListElement({required String text, TextStyle? textStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: AppStyles.style13Normal.copyWith(color: ColorValues.blackColor),
        ).marginOnly(top: Dimens.one, right: Dimens.ten),
        Flexible(
          child: Text(
            text,
            style: textStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            maxLines: 5,
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
              padding: EdgeInsets.only(bottom: Dimens.twentyFour, top: Dimens.twentyFour, left: Dimens.twentyEight, right: Dimens.twentyEight),
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                border: Border.all(color: ColorValues.primaryGreenColor, width: Dimens.two),
                color: ColorValues.whiteColor,
                borderRadius: BorderRadius.circular(Dimens.twelve),
              ),
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
                      StringValues.areYouSureYouWantToStopTheStudyYouWillBeUnableToReturnToTheStudyIfYouAreReturningToTheStudyUseThePauseFunction.tr,
                      style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ).marginOnly(top: Dimens.fifteen, bottom: Dimens.sevenTeen),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomPrimaryButton(
                        btnText: StringValues.cancel.tr,
                        border: Border.all(color: ColorValues.primaryGreenColor, width: Dimens.two),
                        buttonColor: ColorValues.whiteColor,
                        contentPadding: EdgeInsets.symmetric(vertical: Dimens.fifteen),
                        borderRadius: BorderRadius.circular(Dimens.twelve),
                        buttonWidth: Dimens.oneHundredForty,
                        btnTextStyle: AppStyles.style18Bold.copyWith(color: ColorValues.primaryGreenColor),
                        margin: EdgeInsets.only(right: Dimens.twenty),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      CustomPrimaryButton(
                        btnText: StringValues.complete.tr,
                        buttonColor: ColorValues.primaryGreenColor,
                        contentPadding: EdgeInsets.symmetric(vertical: Dimens.fifteen),
                        borderRadius: BorderRadius.circular(Dimens.twelve),
                        buttonWidth: Dimens.oneHundredForty,
                        btnTextStyle: AppStyles.style18Bold.copyWith(color: ColorValues.whiteColor),
                        margin: EdgeInsets.only(left: Dimens.twenty),
                        onTap: () => onCompleteButtonTapped(),
                      ),
                    ],
                  )
                ],
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
