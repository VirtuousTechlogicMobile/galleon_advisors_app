import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../common/custom_primary_button.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';

class ManageStudiesDialogs {
  static void uploadStudyDialog({
    required BuildContext context,
    required String studyName,
    required String positionName,
    required Function() onTapUploadButton,
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
                    child: CommonWidgets.autoSizeText(
                      text: "${StringValues.doYouWantToUpload.tr}$studyName",
                      textStyle: AppStyles.style24Bold.copyWith(color: ColorValues.blackColor),
                      minFontSize: 15,
                      maxFontSize: 24,
                    ),
                  ),
                  Flexible(
                    child: CommonWidgets.autoSizeText(
                      // TODO: add dynamic position name
                      text: "${StringValues.youAreAboutToUploadTheStudiesTo.tr}$positionName.${StringValues.areYouSureYouWantToDoThisThisActionCannotBeUndone.tr}",
                      textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      maxFontSize: 16,
                    ).marginOnly(top: Dimens.twentySeven, bottom: Dimens.twentyFour),
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
                        btnText: StringValues.upload.tr,
                        buttonColor: ColorValues.primaryGreenColor,
                        contentPadding: EdgeInsets.symmetric(vertical: Dimens.fifteen),
                        borderRadius: BorderRadius.circular(Dimens.twelve),
                        buttonWidth: Dimens.oneHundredForty,
                        btnTextStyle: AppStyles.style18Bold.copyWith(color: ColorValues.whiteColor),
                        margin: EdgeInsets.only(left: Dimens.twenty),
                        onTap: () => onTapUploadButton(),
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

  static void deleteStudiesDialog({
    required BuildContext context,
    required Function() onTapDeleteButton,
    required Function() whenComplete,
  }) {
    Get.dialog(
      barrierColor: ColorValues.darkSlateGrayColor,
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // minus appbar and bottom bar height
          width: MediaQuery.of(context).size.width,
          child: AlertDialog(
            alignment: Alignment.center,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.fifty)),
            elevation: 0,
            content: Container(
              padding: EdgeInsets.only(bottom: Dimens.twentyFour, top: Dimens.twentyFour, left: Dimens.twentyEight, right: Dimens.twentyEight),
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                border: Border.all(color: ColorValues.redColor, width: Dimens.two),
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
                      text: StringValues.deleteStudies.tr,
                      textStyle: AppStyles.style24Bold.copyWith(color: ColorValues.redColor),
                      minFontSize: 15,
                      maxFontSize: 24,
                    ),
                  ),
                  Flexible(
                    child: CommonWidgets.autoSizeText(
                      // TODO: add dynamic position name
                      text: StringValues.youAreAboutToDeleteTheStudies.tr,
                      textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.redColor),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      maxFontSize: 16,
                    ).marginOnly(top: Dimens.twentySeven, bottom: Dimens.twentyFour),
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
                        btnText: StringValues.delete.tr,
                        buttonColor: ColorValues.redColor,
                        contentPadding: EdgeInsets.symmetric(vertical: Dimens.fifteen),
                        borderRadius: BorderRadius.circular(Dimens.twelve),
                        buttonWidth: Dimens.oneHundredForty,
                        btnTextStyle: AppStyles.style18Bold.copyWith(color: ColorValues.whiteColor),
                        margin: EdgeInsets.only(left: Dimens.twenty),
                        onTap: () => onTapDeleteButton(),
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
