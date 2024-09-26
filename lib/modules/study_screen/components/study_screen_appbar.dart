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
  final Function() onPressBackButton;
  final bool isStudyPlay;
  final bool isShowEndButton;

  const StudyScreenAppbar(
      {super.key, required this.time, required this.onPlayButtonTap, required this.isStudyPlay, required this.isShowEndButton, required this.onPressBackButton});

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
            onTap: () => onPressBackButton(),
            child: CommonWidgets.fromSvg(svgAsset: SvgAssets.closeRoundedIcon).marginOnly(right: Dimens.fourteen),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.seven),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.eight),
                color: isStudyPlay ? ColorValues.primaryGreenColor : ColorValues.transparent,
              ),
              child: Row(
                children: [
                  CommonWidgets.autoSizeText(
                    text: '(00:00:00)',
                    textStyle: AppStyles.style16Normal.copyWith(color: isStudyPlay ? ColorValues.whiteColor : ColorValues.blackColor),
                    minFontSize: 12,
                    maxFontSize: 16,
                  ).marginOnly(right: Dimens.nineteen, left: Dimens.thirteen),
                  CommonWidgets.autoSizeText(
                    text: 'Test',
                    textStyle: AppStyles.style16Normal.copyWith(color: isStudyPlay ? ColorValues.whiteColor : ColorValues.blackColor),
                    minFontSize: 12,
                    maxFontSize: 16,
                  ),
                  const Spacer(),
                  CommonWidgets.autoSizeText(
                    text: time,
                    textStyle: AppStyles.style16Normal.copyWith(color: isStudyPlay ? ColorValues.whiteColor : ColorValues.blackColor),
                    minFontSize: 12,
                    maxFontSize: 16,
                  ).marginOnly(right: Dimens.thirteen),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => onPlayButtonTap(),
            child: isStudyPlay ? CommonWidgets.fromSvg(svgAsset: SvgAssets.studyRunningIcon) : CommonWidgets.fromSvg(svgAsset: SvgAssets.playRoundedIcon),
          ).marginOnly(left: Dimens.fourteen),
        ],
      ),
    );
  }
}
