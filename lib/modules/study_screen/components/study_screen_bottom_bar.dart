import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../common/custom_primary_button.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';
import '../controller/study_screen_controller.dart';

class StudyScreenBottomBar extends StatelessWidget {
  final Function() onTapSubmitButton;
  final Function() onTapTipsAndTricksButton;
  final Function() onTapOperationAnalysisButton;
  final Function() onTapKeyThemesButton;
  final Function() onTapActivitiesButton;
  final Function() onTapAddButton;

  StudyScreenBottomBar({
    super.key,
    required this.onTapSubmitButton,
    required this.onTapTipsAndTricksButton,
    required this.onTapOperationAnalysisButton,
    required this.onTapKeyThemesButton,
    required this.onTapActivitiesButton,
    required this.onTapAddButton,
  });

  final studyController = Get.find<StudyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.eight, right: Dimens.fourteen, left: Dimens.fourteen),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: CustomPrimaryButton(
                      margin: EdgeInsets.only(right: Dimens.seven),
                      btnText: StringValues.activities.tr,
                      buttonHeight: Dimens.fiftySix,
                      borderRadius: BorderRadius.circular(Dimens.eight),
                      btnTextStyle: AppStyles.style20Normal.copyWith(color: studyController.selectedTab.value == 'activities' ? ColorValues.whiteColor : ColorValues.blackColor),
                      buttonColor: studyController.selectedTab.value == 'activities' ? ColorValues.darkSlateGrayColor : ColorValues.softGrayColor,
                      onTap: () => onTapActivitiesButton(),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => onTapAddButton(),
                      child: Container(
                        margin: EdgeInsets.only(right: Dimens.seven),
                        width: Dimens.eightySix,
                        height: Dimens.fiftySix,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.eight),
                          color: ColorValues.softGrayColor,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: Dimens.ten),
                          decoration: BoxDecoration(
                            color: ColorValues.whiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: ColorValues.blackColor.withOpacity(0.12),
                                offset: const Offset(0, 0),
                                blurRadius: 16,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: CommonWidgets.fromSvg(svgAsset: SvgAssets.addIcon),
                        ),
                      ),
                    ),
                  ),
                ],
              ).marginOnly(right: Dimens.twentySix),
            ),
            Expanded(
              flex: 2,
              child: CustomPrimaryButton(
                margin: EdgeInsets.only(right: Dimens.nineteen),
                buttonHeight: Dimens.fiftySix,
                btnText: StringValues.tipsAndTricks.tr,
                borderRadius: BorderRadius.circular(Dimens.eight),
                btnTextStyle: AppStyles.style16Normal.copyWith(color: studyController.selectedTab.value == 'tips&tricks' ? ColorValues.whiteColor : ColorValues.blackColor),
                btnTextMaxLines: 2,
                contentPadding: EdgeInsets.zero,
                buttonColor: studyController.selectedTab.value == 'tips&tricks' ? ColorValues.darkSlateGrayColor : ColorValues.softGrayColor,
                onTap: () => onTapTipsAndTricksButton(),
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomPrimaryButton(
                margin: EdgeInsets.only(right: Dimens.nineteen),
                buttonHeight: Dimens.fiftySix,
                contentPadding: EdgeInsets.zero,
                btnText: StringValues.operationalAnalysis.tr,
                borderRadius: BorderRadius.circular(Dimens.eight),
                btnTextStyle: AppStyles.style16Normal.copyWith(color: studyController.selectedTab.value == 'operationAnalysis' ? ColorValues.whiteColor : ColorValues.blackColor),
                btnTextMaxLines: 2,
                buttonColor: studyController.selectedTab.value == 'operationAnalysis' ? ColorValues.darkSlateGrayColor : ColorValues.softGrayColor,
                onTap: () => onTapOperationAnalysisButton(),
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomPrimaryButton(
                margin: EdgeInsets.only(right: Dimens.twentyNine),
                buttonHeight: Dimens.fiftySix,
                contentPadding: EdgeInsets.zero,
                btnText: StringValues.keyBackSlashNThemes.tr,
                borderRadius: BorderRadius.circular(Dimens.eight),
                btnTextStyle: AppStyles.style18Normal.copyWith(color: studyController.selectedTab.value == 'keyThemes' ? ColorValues.whiteColor : ColorValues.blackColor),
                btnTextMaxLines: 2,
                buttonColor: studyController.selectedTab.value == 'keyThemes' ? ColorValues.darkSlateGrayColor : ColorValues.lightGrayColor.withOpacity(0.80),
                onTap: () => onTapKeyThemesButton(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Obx(
                () => CustomPrimaryButton(
                  margin: EdgeInsets.zero,
                  btnText: StringValues.submit.tr,
                  buttonHeight: Dimens.fiftySix,
                  border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                  buttonColor: studyController.selectedOpportunityTheme.value != null || studyController.selectedServiceActivities.value != null
                      ? ColorValues.primaryGreenColor
                      : ColorValues.lightGrayColor.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(Dimens.eight),
                  contentPadding: EdgeInsets.zero,
                  btnTextStyle: AppStyles.style16Normal.copyWith(
                    color: studyController.selectedOpportunityTheme.value != null || studyController.selectedServiceActivities.value != null
                        ? ColorValues.whiteColor
                        : ColorValues.blackColor,
                  ),
                  onTap: () => onTapSubmitButton(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
