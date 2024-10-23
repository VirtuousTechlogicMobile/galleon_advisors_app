import 'package:flutter/material.dart';
import 'package:galleon_user/modules/study_screen/components/study_screen_components.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/get_theme_wise_color.dart';
import '../../../utility/responsive.dart';
import '../controller/study_screen_controller.dart';

class StudyScreenAppbar extends StatelessWidget {
  StudyScreenAppbar({super.key});

  final studyController = Get.find<StudyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetResponsiveDimens.getAppBarHeight(context),
      width: Get.width,
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(
        left: GetResponsiveDimens.fifteenAndFourteen(context),
        right: GetResponsiveDimens.fifteenAndEight(context),
        top: GetResponsiveDimens.zeroAndSix(context),
        bottom: GetResponsiveDimens.zeroAndThree(context),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                studyController.onBackPressed();
              },
              child: CommonWidgets.fromSvg(svgAsset: studyController.studyStartTime.isNotEmpty ? SvgAssets.backIconOutlined : SvgAssets.closeRoundedIcon)
                  .marginOnly(right: Dimens.fourteen),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  studyController.onChangeStudyIndex();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                    color: studyController.isStudyStarted.value ? ColorValues.primaryGreenColor : ColorValues.transparent,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '(00:00:00)',
                        style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                      ).marginOnly(right: Dimens.nineteen, left: GetResponsiveDimens.fifteenAndThirteen(context)),
                      Obx(
                        () => Text(
                          studyController.dualStudiesList[studyController.selectedStudyIndex.value],
                          style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => Text(
                          studyController.currentTime.value,
                          style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                        ).marginOnly(
                          right: GetResponsiveDimens.fifteenAndThirteen(context),
                          top: GetResponsiveDimens.twelveAndEight(context),
                          bottom: GetResponsiveDimens.twelveAndEight(context),
                        ),
                      ),
                      // show end button condition
                      if (studyController.studyStartTime.isNotEmpty && !studyController.isStudyStarted.value)
                        InkWell(
                          onTap: () {
                            studyController.isDialogOpen.value = true;
                            StudyScreenComponents.stopStudyDialog(
                              context: context,
                              onCompleteButtonTapped: () {
                                Get.toNamed(AppRoutes.endStudySummary, parameters: {'studyId': '1234'})?.whenComplete(
                                  () {
                                    studyController.isDialogOpen.value = false;
                                    studyController.isStudyStarted.value = false;
                                    studyController.studyStartTime.clear();
                                  },
                                );
                              },
                              whenComplete: () {
                                studyController.isDialogOpen.value = false;
                              },
                            );
                          },
                          child: CommonWidgets.fromSvg(
                            svgAsset: SvgAssets.stopStudyIcon,
                            margin: EdgeInsets.only(left: Dimens.nineteen, right: Dimens.thirty),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                studyController.studyStartTime.add(DateTime.now().toString());
                studyController.isStudyStarted.value = !studyController.isStudyStarted.value;
              },
              child:
                  studyController.isStudyStarted.value ? CommonWidgets.fromSvg(svgAsset: SvgAssets.studyRunningIcon) : CommonWidgets.fromSvg(svgAsset: SvgAssets.playRoundedIcon),
            ).marginOnly(left: Dimens.twelve),
          ],
        ),
      ),
    );
  }
}
