import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/custom_primary_button.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';
import '../../../theme/get_theme_wise_color.dart';
import '../../../utility/responsive.dart';

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
          height: Dimens.screenHeight - (Dimens.eighty * 2), // minus appbar and bottom bar height
          width: Get.width,
          child: AlertDialog(
            alignment: Alignment.topCenter,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.fifty)),
            elevation: 0,
            content: Container(
              padding: EdgeInsets.only(bottom: Dimens.twentyFour, top: Dimens.twentyFour, left: Dimens.twentyEight, right: Dimens.twentyEight),
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
                        "${StringValues.doYouWantToUpload.tr}$studyName",
                        style: GetThemeStyles.getStyle24Bold(context)?.copyWith(color: ColorValues.blackColor),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        // TODO: add dynamic position name
                        "${StringValues.youAreAboutToUploadTheStudiesTo.tr}$positionName.${StringValues.areYouSureYouWantToDoThisThisActionCannotBeUndone.tr}",
                        style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ).marginOnly(top: Dimens.twentySeven, bottom: Dimens.twentyFour),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomPrimaryButton(
                          btnText: StringValues.cancel.tr,
                          border: Border.all(color: ColorValues.primaryGreenColor, width: Dimens.three),
                          buttonColor: ColorValues.whiteColor,
                          contentPadding: EdgeInsets.symmetric(vertical: Dimens.fifteen),
                          borderRadius: BorderRadius.circular(Dimens.twelve),
                          buttonWidth: GetResponsiveDimens.twoHundredEightyAndOneHundredFortyOne(context),
                          btnTextStyle: GetThemeStyles.getStyle20Bold(context)?.copyWith(color: ColorValues.primaryGreenColor),
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
                          buttonWidth: GetResponsiveDimens.twoHundredEightyAndOneHundredFortyOne(context),
                          btnTextStyle: GetThemeStyles.getStyle20Bold(context)?.copyWith(color: ColorValues.whiteColor),
                          margin: EdgeInsets.only(left: Dimens.twenty),
                          onTap: () => onTapUploadButton(),
                        ),
                      ],
                    )
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

  static void deleteStudiesDialog({
    required BuildContext context,
    required Function() onTapDeleteButton,
    required Function() whenComplete,
  }) {
    Get.dialog(
      barrierColor: ColorValues.transparent,
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: Dimens.screenHeight, // minus appbar and bottom bar height
          width: Get.width,
          child: AlertDialog(
            alignment: Alignment.center,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.fifty)),
            elevation: 0,
            content: Container(
              padding: EdgeInsets.only(bottom: Dimens.twentyFour, top: Dimens.twentyFour, left: Dimens.twentyEight, right: Dimens.twentyEight),
              width: GetResponsiveDimens.widthDivTwoAndOnePointFive(context),
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
                    child: Text(
                      StringValues.deleteStudies.tr,
                      style: GetThemeStyles.getStyle24Bold(context)?.copyWith(color: ColorValues.redColor),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      // TODO: add dynamic position name
                      StringValues.youAreAboutToDeleteTheStudies.tr,
                      style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.redColor),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ).marginOnly(top: Dimens.twentySeven, bottom: Dimens.twentyFour),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomPrimaryButton(
                        btnText: StringValues.cancel.tr,
                        border: Border.all(color: ColorValues.primaryGreenColor, width: Dimens.three),
                        buttonColor: ColorValues.whiteColor,
                        contentPadding: EdgeInsets.symmetric(vertical: Dimens.fifteen),
                        borderRadius: BorderRadius.circular(Dimens.twelve),
                        buttonWidth: GetResponsiveDimens.twoHundredEightyAndOneHundredFortyOne(context),
                        btnTextStyle: GetThemeStyles.getStyle20Bold(context)?.copyWith(color: ColorValues.primaryGreenColor),
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
                        buttonWidth: GetResponsiveDimens.twoHundredEightyAndOneHundredFortyOne(context),
                        btnTextStyle: GetThemeStyles.getStyle20Bold(context)?.copyWith(color: ColorValues.whiteColor),
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
