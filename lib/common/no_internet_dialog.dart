import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../constant/styles.dart';
import '../utility/responsive.dart';
import 'custom_primary_button.dart';

class NoInternetDialog {
  static Widget showNoInternetDialog() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: AlertDialog(
          alignment: Alignment.center,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.fifty)),
          elevation: 0,
          content: Container(
            padding: EdgeInsets.only(bottom: Dimens.twenty, top: Dimens.twentyFour, left: Dimens.twentyEight, right: Dimens.twentyEight),
            width: GetResponsiveDimens.widthDivTwoAndOnePointFive(Get.context!),
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
                  child: Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4,
                    size: Dimens.hundred,
                    color: ColorValues.primaryGreenColor,
                  ),
                ),
                Flexible(
                  child: Text(
                    StringValues.oops.tr,
                    style: AppStyles.style28Bold.copyWith(color: ColorValues.blackColor),
                  ),
                ),
                Flexible(
                  child: Text(
                    StringValues.noInternetFoundCheckYourConnection.tr,
                    style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ).marginOnly(top: Dimens.fifteen, bottom: GetResponsiveDimens.twentyAndSevenTeen(Get.context!)),
                ),
                CustomPrimaryButton(
                  btnText: StringValues.ok.tr,
                  border: Border.all(color: ColorValues.primaryGreenColor, width: GetResponsiveDimens.threeAndTwo(Get.context!)),
                  buttonColor: ColorValues.whiteColor,
                  contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.sevenAndNine(Get.context!)),
                  borderRadius: BorderRadius.circular(Dimens.twelve),
                  buttonWidth: GetResponsiveDimens.widthDivFiveAndTwoHundredForty(Get.context!),
                  btnTextStyle: const TextStyle(fontSize: 17, color: ColorValues.primaryGreenColor, fontWeight: FontWeight.w700),
                  margin: EdgeInsets.only(right: Dimens.twenty),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ).marginOnly(top: Dimens.twentySix),
      ),
    );
  }
}
