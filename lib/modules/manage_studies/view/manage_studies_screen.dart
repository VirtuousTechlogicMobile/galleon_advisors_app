import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/common/custom_textfield.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/dimens.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/modules/manage_studies/controller/manage_studies_controller.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../common/custom_checkbox.dart';
import '../../../constant/assets.dart';
import '../components/custom_expansion_tile_widget.dart';
import '../components/manage_studies_appbar.dart';

class ManageStudiesScreen extends StatelessWidget {
  ManageStudiesScreen({super.key});

  final manageStudiesController = Get.find<ManageStudiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      body: SafeArea(
        left: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ManageStudiesAppbar(),
            // studies list
            Expanded(
              child: Obx(
                () => ImageFiltered(
                  enabled: manageStudiesController.isDialogOpen.value,
                  imageFilter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: Dimens.twentyFour, top: Dimens.twentyFour, bottom: Dimens.thirty, right: Dimens.twentyFour),
                          itemCount: manageStudiesController.studyData.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => CustomExpansionTileWidget(
                                title: "${manageStudiesController.studyData[index].departmentName} - ${manageStudiesController.studyData[index].positionName}",
                                isShowGreenDot: manageStudiesController.isAnyStartedStudyInList(index),
                                isShowStar: false,
                                isExpanded: manageStudiesController.expandedListTileIndex.value == index,
                                onTap: () {
                                  if (manageStudiesController.expandedListTileIndex.value == index) {
                                    manageStudiesController.expandedListTileIndex.value = null; // Collapse if tapped again
                                  } else {
                                    manageStudiesController.expandedListTileIndex.value = index; // Expand the tapped one
                                  }
                                },
                                children: [
                                  CustomCheckbox(
                                    isChecked: manageStudiesController.getTotalUnStartedStudyCount(index) == manageStudiesController.selectedStudyCheckBoxIndex.length,
                                    checkBoxWidth: GetResponsiveDimens.fiftyTwoAndTwentyThree(context),
                                    checkBoxHeight: GetResponsiveDimens.fiftyFiveAndTwentyThree(context),
                                    paddingBetween: GetResponsiveDimens.tenAndEight(context),
                                    child: Text(
                                      'Select All',
                                      style: GetResponsiveFontStyle.getStyle20And18Bold(context).copyWith(color: ColorValues.blackColor),
                                    ),
                                    onValueChange: (value) {
                                      manageStudiesController.onSelectedAll(index);
                                    },
                                  ).marginOnly(bottom: Dimens.twenty, top: Dimens.five),
                                  ...List.generate(
                                    manageStudiesController.studyData[index].studyData.length,
                                    (studyIndex) {
                                      return Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: CustomCheckbox(
                                              isShowCheckBox: manageStudiesController.studyData[index].studyData[studyIndex].isStart != true,
                                              isChecked:
                                                  manageStudiesController.selectedStudyCheckBoxIndex.contains(manageStudiesController.studyData[index].studyData[studyIndex]),
                                              paddingBetween: GetResponsiveDimens.elevenAndNine(context),
                                              // switch between text field and text for rename
                                              child: manageStudiesController.renameStudyById.value == manageStudiesController.studyData[index].studyData[studyIndex].studyId
                                                  ? SizedBox(
                                                      width: Get.width / 3.5,
                                                      child: CustomTextField(
                                                        controller: manageStudiesController.renameStudyController,
                                                        maxLines: 1,
                                                        contentPadding: EdgeInsets.symmetric(
                                                          vertical: GetResponsiveDimens.tenAndEight(context),
                                                          horizontal: Dimens.fourteen,
                                                        ),
                                                        borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                                                        fillColor: ColorValues.softGrayColor.withOpacity(0.40),
                                                        textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.50)),
                                                        borderSide: BorderSide(color: ColorValues.lightGrayColor, width: Dimens.one),
                                                        autofocus: true,
                                                        onSubmit: (p0) {
                                                          manageStudiesController.renameStudyName();
                                                        },
                                                        onTapOutside: (p0) {
                                                          manageStudiesController.renameStudyName();
                                                        },
                                                      ).marginOnly(bottom: Dimens.five),
                                                    )
                                                  : InkWell(
                                                      onTap: () {
                                                        /// toggle between rename study
                                                        if (manageStudiesController.renameStudyById.value ==
                                                            manageStudiesController.studyData[index].studyData[studyIndex].studyId) {
                                                          manageStudiesController.renameStudyById.value = null; // Collapse if tapped again
                                                          manageStudiesController.renameStudyController.text = '';
                                                        } else {
                                                          manageStudiesController.renameStudyById.value =
                                                              manageStudiesController.studyData[index].studyData[studyIndex].studyId; // Expand the tapped one
                                                          manageStudiesController.renameStudyController.text =
                                                              manageStudiesController.studyData[index].studyData[studyIndex].studyName;
                                                        }
                                                      },
                                                      child: Text(
                                                        manageStudiesController.studyData[index].studyData[studyIndex].studyName,
                                                        style: GetResponsiveFontStyle.getStyle20And18Normal(context).copyWith(color: ColorValues.darkSlateGrayColor),
                                                      ),
                                                    ),
                                              onValueChange: (value) {
                                                if (manageStudiesController.selectedStudyCheckBoxIndex.contains(manageStudiesController.studyData[index].studyData[studyIndex])) {
                                                  manageStudiesController.selectedStudyCheckBoxIndex.remove(manageStudiesController.studyData[index].studyData[studyIndex]);
                                                } else {
                                                  manageStudiesController.selectedStudyCheckBoxIndex.add(manageStudiesController.studyData[index].studyData[studyIndex]);
                                                }
                                              },
                                            ),
                                          ),
                                          viewButton(isStudyStart: manageStudiesController.studyData[index].studyData[studyIndex].isStart, context: context),
                                        ],
                                      ).marginOnly(
                                        bottom: studyIndex != (manageStudiesController.studyData[index].studyData.length - 1) ? Dimens.ten : Dimens.zero,
                                      );
                                    },
                                  ),
                                ],
                              ).marginOnly(bottom: Dimens.eleven),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewButton({required bool isStudyStart, required BuildContext context}) {
    return !isStudyStart
        ? CustomPrimaryButton(
            btnText: StringValues.view.tr,
            borderRadius: BorderRadius.circular(Dimens.eleven),
            contentPadding: EdgeInsets.symmetric(vertical: Dimens.twelve),
            buttonWidth: GetResponsiveDimens.threeHundredFiftyAndOneHundredFifty(context),
            btnTextStyle: AppStyles.style16Bold.copyWith(color: ColorValues.whiteColor),
            buttonColor: ColorValues.primaryGreenColor,
            onTap: () {
              Get.toNamed(AppRoutes.endStudySummary, parameters: {'studyId': ''});
            },
          )
        : SizedBox(
            width: GetResponsiveDimens.threeHundredFiftyAndOneHundredFifty(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // study start button
                InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.study);
                    },
                    child: CommonWidgets.fromSvg(svgAsset: SvgAssets.studyRunningIcon, /*height: Dimens.thirtySix, width: Dimens.thirtyFour, */ boxFit: BoxFit.fill)),
                Expanded(
                  child: CustomPrimaryButton(
                    margin: EdgeInsets.only(left: Dimens.five),
                    btnText: StringValues.view.tr,
                    borderRadius: BorderRadius.circular(Dimens.eleven),
                    contentPadding: EdgeInsets.only(top: Dimens.twelve, bottom: Dimens.twelve, left: Dimens.fifteen),
                    // buttonHeight: Dimens.thirtySix,
                    btnTextStyle: AppStyles.style16Bold.copyWith(color: ColorValues.whiteColor),
                    buttonColor: ColorValues.primaryGreenColor,
                    textAlignment: Alignment.centerLeft,
                    onTap: () {
                      Get.toNamed(AppRoutes.study);
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
