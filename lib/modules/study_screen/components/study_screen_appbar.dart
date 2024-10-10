import 'package:flutter/material.dart';
import 'package:galleon_user/modules/study_screen/components/study_screen_components.dart';
import 'package:get/get.dart';
import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../../../utility/responsive.dart';
import '../controller/study_screen_controller.dart';

class StudyScreenAppbar extends StatelessWidget {
  StudyScreenAppbar({super.key});

  final studyController = Get.find<StudyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context) ? 50 : Dimens.fifty,
      width: MediaQuery.sizeOf(context).width,
      color: ColorValues.whiteColor,
      padding: Responsive.isMobile(context)
          ? EdgeInsets.only(left: Dimens.fifteen, right: Dimens.fifteen)
          : EdgeInsets.only(left: Dimens.fourteen, top: Dimens.six, bottom: Dimens.three, right: Dimens.eight),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                studyController.onBackPressed();
              },
              child: CommonWidgets.fromSvg(svgAsset: studyController.studyStartTime.isNotEmpty ? SvgAssets.backIconOutlined : SvgAssets.closeRoundedIcon)
                  .marginOnly(right: Dimens.fourteen),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Responsive.isMobile(context) ? Dimens.ten : Dimens.eight),
                  color: studyController.isStudyStarted.value ? ColorValues.primaryGreenColor : ColorValues.transparent,
                ),
                child: Row(
                  children: [
                    Text(
                      '(00:00:00)',
                      style: AppStyles.style16Normal.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                    ).marginOnly(right: Dimens.nineteen, left: Responsive.isMobile(context) ? Dimens.fifteen : Dimens.thirteen),
                    InkWell(
                      onTap: () {
                        studyController.onChangeStudyIndex();
                      },
                      child: Obx(
                        () => Text(
                          studyController.dualStudiesList[studyController.selectedStudyIndex.value],
                          style: AppStyles.style16Normal.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () => Text(
                        studyController.currentTime.value,
                        style: AppStyles.style16Normal.copyWith(color: studyController.isStudyStarted.value ? ColorValues.whiteColor : ColorValues.blackColor),
                      ).marginOnly(
                          right: Responsive.isMobile(context) ? Dimens.fifteen : Dimens.thirteen,
                          top: Responsive.isMobile(context) ? Dimens.ten : Dimens.eight,
                          bottom: Responsive.isMobile(context) ? Dimens.seven : Dimens.nine),
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
