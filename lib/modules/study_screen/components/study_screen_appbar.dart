import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';

class StudyScreenAppbar extends StatelessWidget {
  final String time;
  final Function() onPlayButtonTap;
  final bool isStudyPlay;

  const StudyScreenAppbar({super.key, required this.time, required this.onPlayButtonTap, required this.isStudyPlay});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(left: Dimens.fourteen, top: Dimens.nine, bottom: Dimens.seven, right: Dimens.eight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: CommonWidgets.fromSvg(svgAsset: SvgAssets.closeRoundedIcon).marginOnly(right: Dimens.twentySeven),
          ),
          CommonWidgets.autoSizeText(
            text: '(00:00:00)',
            textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            minFontSize: 12,
            maxFontSize: 16,
          ).marginOnly(right: Dimens.nineteen),
          CommonWidgets.autoSizeText(
            text: 'Test',
            textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            minFontSize: 12,
            maxFontSize: 16,
          ),
          const Spacer(),
          CommonWidgets.autoSizeText(
            text: time,
            textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            minFontSize: 12,
            maxFontSize: 16,
          ).marginOnly(right: Dimens.twentySeven),
          InkWell(
            onTap: () => onPlayButtonTap(),
            child: isStudyPlay ? CommonWidgets.fromSvg(svgAsset: SvgAssets.studyRunningIcon) : CommonWidgets.fromSvg(svgAsset: SvgAssets.playRoundedIcon),
          ),
        ],
      ),
    );
  }
}
