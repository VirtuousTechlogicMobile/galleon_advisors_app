import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';

class EndStudySummaryScreenAppbar extends StatelessWidget {
  final String time;
  final String programName;
  final Function() onEndButtonTap;
  final bool isShowEndButton;

  const EndStudySummaryScreenAppbar({
    super.key,
    required this.time,
    required this.programName,
    this.isShowEndButton = true,
    required this.onEndButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetResponsiveDimens.getAppBarHeight(context),
      width: Get.width,
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(
        left: Dimens.fourteen,
        top: GetResponsiveDimens.eightAndSix(context),
        bottom: GetResponsiveDimens.sixAndThree(context),
        right: GetResponsiveDimens.tenAndEight(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isShowEndButton)
            InkWell(
              onTap: () {
                Get.back();
              },
              child: CommonWidgets.fromSvg(svgAsset: SvgAssets.backIconOutlined).marginOnly(right: Dimens.twentyFive, bottom: Dimens.five),
            ),
          Text(
            time,
            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
          ),
          Text(
            programName,
            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
          ).marginOnly(left: Dimens.sixTeen),
          const Spacer(),
          if (isShowEndButton)
            CustomPrimaryButton(
              buttonWidth: GetResponsiveDimens.twoHundredEightyAndOneHundredFortyOne(context),
              btnText: StringValues.end.tr,
              contentPadding: EdgeInsets.zero,
              btnTextStyle: AppStyles.style20Normal.copyWith(color: ColorValues.whiteColor),
              borderRadius: BorderRadius.circular(GetResponsiveDimens.nineAndEight(context)),
              onTap: () => onEndButtonTap(),
            ),
        ],
      ),
    );
  }
}
