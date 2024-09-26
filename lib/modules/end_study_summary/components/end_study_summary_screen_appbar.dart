import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';

class EndStudySummaryScreenAppbar extends StatelessWidget {
  final String time;
  final String programName;
  final Function() onEndButtonTap;

  const EndStudySummaryScreenAppbar({
    super.key,
    required this.time,
    required this.programName,
    required this.onEndButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(left: Dimens.fourteen, top: Dimens.six, bottom: Dimens.three, right: Dimens.eight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonWidgets.autoSizeText(
            text: time,
            textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            minFontSize: 12,
            maxFontSize: 16,
          ),
          CommonWidgets.autoSizeText(
            text: programName,
            textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            minFontSize: 12,
            maxFontSize: 16,
          ).marginOnly(left: Dimens.sixTeen),
          const Spacer(),
          CustomPrimaryButton(
            buttonWidth: Dimens.oneHundredFortyOne,
            btnText: StringValues.end.tr,
            buttonHeight: Dimens.fortyOne,
            contentPadding: EdgeInsets.zero,
            btnTextStyle: AppStyles.style18Normal.copyWith(color: ColorValues.whiteColor),
            borderRadius: BorderRadius.circular(Dimens.eight),
            onTap: () => onEndButtonTap(),
          ),
        ],
      ),
    );
  }
}
