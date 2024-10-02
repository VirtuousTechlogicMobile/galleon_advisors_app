import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/modules/study_screen/components/study_screen_components.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../controller/study_screen_controller.dart';

class StudyScreenAppbar extends StatelessWidget {
  StudyScreenAppbar({
    super.key,
  });

  final studyController = Get.find<StudyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(left: Dimens.fourteen, top: Dimens.nine, bottom: Dimens.seven, right: Dimens.eight),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                studyController.onBackPressed();
              },
              child: CommonWidgets.fromSvg(svgAsset: SvgAssets.closeRoundedIcon).marginOnly(right: Dimens.fourteen),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.seven),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.eight),
                  color: studyController.isStudyStarted.value ? ColorValues.primaryGreenColor : ColorValues.transparent,
                ),
                child: Row(
                  children: [
                    CommonWidgets.autoSizeText(
                      text: '(00:00:00)',
                      textStyle: AppStyles.style16Normal.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                      minFontSize: 12,
                      maxFontSize: 16,
                    ).marginOnly(right: Dimens.nineteen, left: Dimens.thirteen),
                    InkWell(
                      onTap: () {
                        studyController.onChangeStudyIndex();
                      },
                      child: Obx(
                        () => CommonWidgets.autoSizeText(
                          text: studyController.dualStudiesList[studyController.selectedStudyIndex.value],
                          textStyle: AppStyles.style16Normal.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                          minFontSize: 12,
                          maxFontSize: 16,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () => CommonWidgets.autoSizeText(
                        text: studyController.currentTime.value,
                        textStyle: AppStyles.style16Normal.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                        minFontSize: 12,
                        maxFontSize: 16,
                      ).marginOnly(right: Dimens.thirteen),
                    ),
                    // show end button condition
                    if (studyController.studyStartTime.isNotEmpty && !studyController.isStudyStarted.value)
                      InkWell(
                        onTap: () {
                          studyController.isDialogOpen.value = true;
                          StudyScreenComponents.stopStudyDialog(
                            context: context,
                            onCompleteButtonTapped: () {
                              Get.toNamed(AppRoutes.endStudySummary, parameters: {'studyId': '1234'});
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
            InkWell(
              onTap: () {
                studyController.studyStartTime.add(DateTime.now().toString());
                studyController.isStudyStarted.value = !studyController.isStudyStarted.value;
              },
              child:
                  studyController.isStudyStarted.value ? CommonWidgets.fromSvg(svgAsset: SvgAssets.studyRunningIcon) : CommonWidgets.fromSvg(svgAsset: SvgAssets.playRoundedIcon),
            ).marginOnly(left: Dimens.fourteen),
          ],
        ),
      ),
    );
  }
}
