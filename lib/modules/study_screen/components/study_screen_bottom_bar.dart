import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/common_widgets.dart';
import '../../../common/custom_primary_button.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';
import '../../../utility/responsive.dart';
import '../controller/study_screen_controller.dart';

class StudyScreenBottomBar extends StatelessWidget {
  final Function() onTapSubmitButton;
  final Function() onTapTipsAndTricksButton;
  final Function() onTapOperationAnalysisButton;
  final Function() onTapKeyThemesButton;
  final Function() onTapActivitiesButton;
  final Function() onTapAddButton;
  final bool isMerge;
  final bool isSplit;

  StudyScreenBottomBar({
    super.key,
    required this.onTapSubmitButton,
    required this.onTapTipsAndTricksButton,
    required this.onTapOperationAnalysisButton,
    required this.onTapKeyThemesButton,
    required this.onTapActivitiesButton,
    required this.onTapAddButton,
    required this.isMerge,
    required this.isSplit,
  });

  final studyController = Get.find<StudyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(
          top: GetResponsiveDimens.tenAndEight(context),
          bottom: GetResponsiveDimens.tenAndEight(context),
          right: GetResponsiveDimens.sixteenAndFourteen(context),
          left: Dimens.fourteen),
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
                      borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                      btnTextStyle: GetResponsiveFontStyle.getStyle20And18Normal(context)
                          .copyWith(color: studyController.selectedTab.value == 'activities' ? ColorValues.whiteColor : ColorValues.blackColor),
                      contentPadding: EdgeInsets.zero,
                      buttonColor: studyController.selectedTab.value == 'activities' ? ColorValues.darkSlateGrayColor : ColorValues.softGrayColor,
                      onTap: () => onTapActivitiesButton(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => onTapAddButton(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                          color: ColorValues.softGrayColor,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
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
                margin: EdgeInsets.only(right: Dimens.nineteen, left: GetResponsiveDimens.sevenAndNine(context)),
                btnText: StringValues.tipsAndTricksWithSlashN.tr,
                borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
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
                contentPadding: EdgeInsets.zero,
                btnText: StringValues.operationalAnalysis.tr,
                borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
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
                contentPadding: EdgeInsets.zero,
                btnText: StringValues.keyBackSlashNThemes.tr,
                borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                btnTextStyle: AppStyles.style16Normal.copyWith(color: studyController.selectedTab.value == 'keyThemes' ? ColorValues.whiteColor : ColorValues.darkSlateGrayColor),
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
                  btnText: isMerge
                      ? StringValues.merge.tr
                      : isSplit
                          ? StringValues.split.tr
                          : StringValues.submit.tr,
                  border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                  buttonColor: studyController.selectedOpportunityTheme.value != null || studyController.selectedServiceActivities != null || isSplit || isMerge
                      ? ColorValues.primaryGreenColor
                      : ColorValues.lightGrayColor.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                  contentPadding: EdgeInsets.zero,
                  btnTextStyle: AppStyles.style16Normal.copyWith(
                    color: studyController.selectedOpportunityTheme.value != null || studyController.selectedServiceActivities != null || isSplit || isMerge
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
