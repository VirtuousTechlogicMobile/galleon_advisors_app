import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/constant/assets.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/modules/study_screen/controller/study_screen_controller.dart';
import 'package:galleon_advisors_app/utility/utility.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../components/list_wheel_scroll_picker.dart';
import '../components/study_screen_appbar.dart';

class StudyScreen extends StatelessWidget {
  StudyScreen({super.key});

  final studyController = Get.find<StudyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => StudyScreenAppbar(
                time: '10:49:05 Tue, 30 Apr 24',
                isStudyPlay: studyController.isStudyStarted.value,
                onPlayButtonTap: () {
                  studyController.isStudyStarted.value = !studyController.isStudyStarted.value;
                },
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Flexible(
                                  flex: 3,
                                  child: studyController.opportunityTapped.value
                                      ? ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 10,
                                            sigmaY: 10,
                                          ),
                                          child: IgnorePointer(child: serviceActivitiesLayout()),
                                        )
                                      : serviceActivitiesLayout(),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: volumeLayout(),
                              ),
                              Obx(
                                () => Flexible(
                                  flex: 3,
                                  child: studyController.servicesTapped.value
                                      ? ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 10,
                                            sigmaY: 10,
                                          ),
                                          child: IgnorePointer(child: opportunityThemeLayout()),
                                        )
                                      : opportunityThemeLayout(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// comment & opportunity flag button
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: CustomPrimaryButton(
                                margin: EdgeInsets.only(left: Dimens.twentyTwo, right: Dimens.eight),
                                btnText: StringValues.comment.tr,
                                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                                buttonColor: ColorValues.softWhiteColor,
                                borderRadius: BorderRadius.circular(Dimens.eight),
                                contentPadding: EdgeInsets.symmetric(vertical: Dimens.eight),
                                btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: CustomPrimaryButton(
                                margin: EdgeInsets.only(left: Dimens.eight, right: Dimens.twentySeven),
                                btnText: StringValues.opportunityFlag.tr,
                                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                                buttonColor: ColorValues.softWhiteColor,
                                borderRadius: BorderRadius.circular(Dimens.eight),
                                contentPadding: EdgeInsets.symmetric(vertical: Dimens.eight),
                                btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                              ),
                            ),
                          ],
                        ).marginOnly(bottom: Dimens.nine),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: studyTimeLineLayout(),
                  ),
                ],
              ),
            ),
            bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Container(
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.eight, right: Dimens.fourteen, left: Dimens.fourteen),
      child: Row(
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
                    btnTextStyle: AppStyles.style20Normal.copyWith(color: ColorValues.whiteColor),
                    buttonColor: ColorValues.darkSlateGrayColor,
                  ),
                ),
                Flexible(
                  flex: 1,
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
              btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
              btnTextMaxLines: 2,
              contentPadding: EdgeInsets.zero,
              buttonColor: ColorValues.softGrayColor,
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
              btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
              btnTextMaxLines: 2,
              buttonColor: ColorValues.softGrayColor,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomPrimaryButton(
              margin: EdgeInsets.only(right: Dimens.twentyNine),
              buttonHeight: Dimens.fiftySix,
              contentPadding: EdgeInsets.zero,
              btnText: StringValues.keyThemes.tr,
              borderRadius: BorderRadius.circular(Dimens.eight),
              btnTextStyle: AppStyles.style18Normal.copyWith(color: ColorValues.blackColor),
              btnTextMaxLines: 2,
              buttonColor: ColorValues.lightGrayColor.withOpacity(0.80),
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
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceActivitiesLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.twenty, left: Dimens.fourteen, bottom: Dimens.eighteen),
      decoration: BoxDecoration(
        color: ColorValues.softWhiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
        boxShadow: [
          BoxShadow(
            color: ColorValues.blackColor.withOpacity(0.25),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
              color: ColorValues.deepGreenColor.withOpacity(0.25),
            ),
            child: Text(
              StringValues.serviceActivities.tr,
              style: AppStyles.style14Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
                child: ListWheelScrollPicker(
                  itemsList: studyController.serviceActivitiesItems,
                  selectedIndex: studyController.selectedServiceActivities.value ?? 0,
                  isScroll: studyController.isStudyStarted.value,
                  onSelectedItemChanged: (selectedValue) {
                    studyController.servicesTapped.value = true;
                    studyController.selectedServiceActivities.value = selectedValue;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget volumeLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.twenty, left: Dimens.nine, bottom: Dimens.eighteen, right: Dimens.seven),
      decoration: BoxDecoration(
        color: ColorValues.softWhiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
        boxShadow: [
          BoxShadow(
            color: ColorValues.blackColor.withOpacity(0.25),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
              color: ColorValues.deepYellowColor.withOpacity(0.40),
            ),
            child: Text(
              StringValues.volume.tr,
              style: AppStyles.style14Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
                child: ListWheelScrollPicker(
                  itemsList: studyController.volumeItems,
                  selectedIndex: studyController.selectedVolume.value,
                  isScroll: studyController.isStudyStarted.value,
                  onSelectedItemChanged: (selectedValue) {
                    studyController.selectedVolume.value = selectedValue;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget opportunityThemeLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.eighteen, right: Dimens.eighteen),
      decoration: BoxDecoration(
        color: ColorValues.softWhiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
        boxShadow: [
          BoxShadow(
            color: ColorValues.blackColor.withOpacity(0.25),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
              color: ColorValues.deepGreyColor.withOpacity(0.25),
            ),
            child: Text(
              StringValues.opportunityThemes.tr,
              style: AppStyles.style14Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
                child: ListWheelScrollPicker(
                  itemsList: studyController.opportunityThemes,
                  selectedIndex: studyController.selectedOpportunityTheme.value ?? 0,
                  isScroll: studyController.isStudyStarted.value,
                  onSelectedItemChanged: (selectedValue) {
                    studyController.opportunityTapped.value = true;
                    studyController.selectedOpportunityTheme.value = selectedValue;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget studyTimeLineLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.twenty, left: Dimens.fourteen, bottom: Dimens.eleven, right: Dimens.nine),
      decoration: BoxDecoration(
        color: ColorValues.appBgColor,
        border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
        boxShadow: [
          BoxShadow(
            color: ColorValues.blackColor.withOpacity(0.25),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
              color: ColorValues.darkSlateGrayColor,
            ),
            child: Text(
              StringValues.studyTimeline.tr,
              style: AppStyles.style16Normal.copyWith(
                color: ColorValues.whiteColor,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: studyController.studyTimeLineData.length,
                padding: EdgeInsets.only(top: Dimens.two),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: Dimens.six, bottom: Dimens.five),
                    color: ColorValues.whiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Dimens.thirtyThree,
                          height: Dimens.thirtyTwo,
                          margin: EdgeInsets.only(right: Dimens.fifteen),
                          decoration: BoxDecoration(
                            color: studyController.studyTimeLineData[index].type == 'service'
                                ? ColorValues.primaryGreenColor.withOpacity(0.25)
                                : ColorValues.deepGreyColor.withOpacity(0.25),
                            border: Border.all(
                              color: ColorValues.darkSlateGrayColor,
                              width: Dimens.one,
                            ),
                            borderRadius: BorderRadius.circular(Dimens.eight),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonWidgets.autoSizeText(
                                text: "${studyController.studyTimeLineData[index].fromTime} - ${studyController.studyTimeLineData[index].toTime} "
                                    "(${AppUtility.getTimeDifference(studyController.studyTimeLineData[index].fromTime, studyController.studyTimeLineData[index].toTime)})",
                                textStyle: AppStyles.style12Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.80)),
                                minFontSize: 12,
                                maxLines: 1,
                                maxFontSize: 12,
                              ).marginOnly(bottom: Dimens.three),
                              CommonWidgets.autoSizeText(
                                text: studyController.studyTimeLineData[index].heading,
                                textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                                maxLines: 1,
                                minFontSize: 16,
                                maxFontSize: 16,
                              ),
                            ],
                          ),
                        )
                      ],
                    ).paddingOnly(left: Dimens.sixTeen, right: Dimens.eight, top: Dimens.six, bottom: Dimens.six),
                  );
                },
              ),
            ), /*Column(
              children: List.generate(
                studyController.studyTimeLineData.length,
                (index) {

                },
              ),
            ).paddingOnly(top: Dimens.two),*/
          ),
        ],
      ),
    );
  }
}
