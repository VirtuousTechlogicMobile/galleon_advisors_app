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
        CommonWidgets.autoSizeText(
          text: '•',
          textStyle: AppStyles.style13Normal.copyWith(color: ColorValues.blackColor),
          minFontSize: 10,
          maxFontSize: 13,
        ).marginOnly(top: Dimens.one, right: Dimens.ten),
        Flexible(
          child: CommonWidgets.autoSizeText(
            text: text,
            textStyle: textStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            minFontSize: 10,
            maxLines: 5,
            maxFontSize: 16,
          ),
        ),
      ],
    );
  }

  static void stopStudyDialog({
    required BuildContext context,
    required Function() onComplete,
  }) {
    Get.dialog(
      barrierColor: ColorValues.transparent,
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - (Dimens.eighty * 2), // minus appbar and bottom bar height
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: Dimens.seventy,
                left: 0,
                right: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(
                    height: MediaQuery.of(context).size.height - (Dimens.seventy * 2),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
              AlertDialog(
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
                        child: CommonWidgets.autoSizeText(
                          text: StringValues.doYouWantToStopStudyName.tr,
                          textStyle: AppStyles.style24Bold.copyWith(color: ColorValues.blackColor),
                          minFontSize: 15,
                          maxFontSize: 24,
                        ),
                      ),
                      Flexible(
                        child: CommonWidgets.autoSizeText(
                          text: StringValues.areYouSureYouWantToStopTheStudyYouWillBeUnableToReturnToTheStudyIfYouAreReturningToTheStudyUseThePauseFunction.tr,
                          textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          minFontSize: 10,
                          maxFontSize: 16,
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
                            buttonWidth: MediaQuery.of(context).size.width / 8,
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
                            buttonWidth: MediaQuery.of(context).size.width / 8,
                            btnTextStyle: AppStyles.style18Bold.copyWith(color: ColorValues.whiteColor),
                            margin: EdgeInsets.only(left: Dimens.twenty),
                            onTap: () => onComplete(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ).marginOnly(top: Dimens.twentySix),
            ],
          ),
        ),
      ),
      transitionCurve: Curves.linear,
      barrierDismissible: false,
    );
  }
}
