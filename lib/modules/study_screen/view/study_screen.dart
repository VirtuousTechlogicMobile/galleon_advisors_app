import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/modules/study_screen/components/study_screen_bottom_bar.dart';
import 'package:galleon_advisors_app/modules/study_screen/controller/study_screen_controller.dart';
import 'package:galleon_advisors_app/utility/utility.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../routes/app_pages.dart';
import '../components/list_wheel_scroll_picker.dart';
import '../components/study_screen_appbar.dart';
import '../model/operational_analysis_data_model.dart';

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
                isShowEndButton: studyController.studyStartTime.isNotEmpty && !studyController.isStudyStarted.value,
                onPlayButtonTap: () {
                  studyController.studyStartTime.add(DateTime.now().toString());
                  studyController.isStudyStarted.value = !studyController.isStudyStarted.value;
                },
                onPressBackButton: () {
                  studyController.onBackPressed();
                },
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Obx(
                    () => Flexible(
                      flex: 2,
                      child: studyController.getCurrentTabIndex() == 0
                          ? activitiesLayout()
                          : studyController.getCurrentTabIndex() == 2
                              ? tipsAndTricksLayout()
                              : studyController.getCurrentTabIndex() == 3
                                  ? operationalAnalysisLayout()
                                  : keyThemesLayout(),
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

  Widget activitiesLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Flexible(
            child: studyController.selectedActivitiesSubTab.value == 'comment'
                ? commentsLayout()
                : studyController.selectedActivitiesSubTab.value == 'opportunityFlag'
                    ? opportunityLayout()
                    : Row(
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
                      ).marginSymmetric(horizontal: Dimens.fourteen),
          ),
        ),

        /// comment & opportunity flag button
        Row(
          children: [
            Obx(
              () => Flexible(
                flex: 1,
                child: CustomPrimaryButton(
                  margin: EdgeInsets.only(left: Dimens.twentyTwo, right: Dimens.eight),
                  btnText: StringValues.comment.tr,
                  border: studyController.selectedActivitiesSubTab.value == 'comment'
                      ? Border.all(color: ColorValues.whiteColor, width: Dimens.four)
                      : Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                  buttonColor: studyController.selectedActivitiesSubTab.value == 'comment' ? ColorValues.fontLightGrayColor.withOpacity(0.25) : ColorValues.softWhiteColor,
                  borderRadius: BorderRadius.circular(Dimens.eight),
                  contentPadding: EdgeInsets.symmetric(vertical: studyController.selectedActivitiesSubTab.value == 'comment' ? Dimens.four : Dimens.eight),
                  btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                  onTap: () {
                    studyController.onChangeActivitiesSubTab(0);
                  },
                ),
              ),
            ),
            Obx(
              () => Flexible(
                flex: 1,
                child: studyController.servicesTapped.value
                    ? ClipRect(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: IgnorePointer(
                            child: CustomPrimaryButton(
                              margin: EdgeInsets.zero,
                              btnText: StringValues.opportunityFlag.tr,
                              border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                              buttonColor: ColorValues.softWhiteColor,
                              borderRadius: BorderRadius.circular(Dimens.eight),
                              contentPadding: EdgeInsets.symmetric(vertical: Dimens.eight),
                              btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                            ),
                          ).marginOnly(left: Dimens.eight, right: Dimens.twentySeven),
                        ),
                      )
                    : CustomPrimaryButton(
                        margin: EdgeInsets.only(left: Dimens.eight, right: Dimens.twentySeven),
                        btnText: StringValues.opportunityFlag.tr,
                        border: studyController.selectedActivitiesSubTab.value == 'opportunityFlag'
                            ? Border.all(color: ColorValues.whiteColor, width: Dimens.four)
                            : Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                        buttonColor:
                            studyController.selectedActivitiesSubTab.value == 'opportunityFlag' ? ColorValues.fontLightGrayColor.withOpacity(0.25) : ColorValues.softWhiteColor,
                        borderRadius: BorderRadius.circular(Dimens.eight),
                        contentPadding: EdgeInsets.symmetric(vertical: studyController.selectedActivitiesSubTab.value == 'opportunityFlag' ? Dimens.four : Dimens.eight),
                        btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                        onTap: () {
                          studyController.onChangeActivitiesSubTab(1);
                        },
                      ),
              ),
            ),
          ],
        ).marginOnly(bottom: Dimens.nine),
      ],
    );
  }

  Widget commentsLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.five, left: Dimens.twentyTwo, bottom: Dimens.eight, right: Dimens.twentySix),
      padding: EdgeInsets.only(right: Dimens.ten),
      decoration: BoxDecoration(
        color: ColorValues.whiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.softWhiteColor),
        borderRadius: BorderRadius.only(topRight: Radius.circular(Dimens.twenty), topLeft: Radius.circular(Dimens.twenty)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: Dimens.one),
                      color: ColorValues.deepYellowColor.withOpacity(0.40),
                      width: constraints.maxWidth / 2,
                      alignment: Alignment.topCenter,
                      child: CommonWidgets.autoSizeText(
                        text: StringValues.comment.tr,
                        textStyle: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
                        minFontSize: 12,
                        maxFontSize: 14,
                      ),
                    ),
                    CommonWidgets.autoSizeText(
                      text: 'Free Text as well as auto-safe.',
                      textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                      minFontSize: 12,
                      maxFontSize: 16,
                    ).marginOnly(top: Dimens.twentySix, left: Dimens.twentyNine),
                  ],
                ).marginOnly(top: Dimens.sevenTeen, bottom: Dimens.ten);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimens.four),
            decoration: BoxDecoration(border: Border.all(width: Dimens.four, color: ColorValues.softWhiteColor)),
          ),
          Expanded(
            flex: 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: Dimens.one),
                      width: constraints.maxWidth / 2,
                      alignment: Alignment.topCenter,
                      color: ColorValues.deepYellowColor.withOpacity(0.40),
                      child: CommonWidgets.autoSizeText(
                        text: StringValues.identifier.tr,
                        textStyle: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
                        minFontSize: 12,
                        maxFontSize: 14,
                      ),
                    ),
                  ],
                ).marginOnly(top: Dimens.sevenTeen, bottom: Dimens.ten);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget opportunityLayout() {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        padding: EdgeInsets.symmetric(vertical: Dimens.eighteen),
        margin: EdgeInsets.only(top: Dimens.five, left: Dimens.twentyTwo, bottom: Dimens.eight, right: Dimens.twentySix),
        decoration: BoxDecoration(
          color: ColorValues.whiteColor,
          border: Border.all(width: Dimens.four, color: ColorValues.softWhiteColor),
          borderRadius: BorderRadius.only(topRight: Radius.circular(Dimens.twenty), topLeft: Radius.circular(Dimens.twenty)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              studyController.opportunityFlagList.length,
              (index) {
                return Obx(
                  () => CustomPrimaryButton(
                    btnText: studyController.opportunityFlagList[index],
                    buttonWidth: Dimens.twoHundredForty,
                    contentPadding: EdgeInsets.symmetric(vertical: Dimens.twelve),
                    margin: EdgeInsets.only(bottom: Dimens.sevenTeen),
                    borderRadius: BorderRadius.circular(Dimens.eight),
                    onTap: () {
                      studyController.selectedOpportunityFlag.value = index;
                    },
                    border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                    buttonColor: studyController.selectedOpportunityFlag.value == index ? ColorValues.primaryGreenAccentColor.withOpacity(0.25) : ColorValues.whiteColor,
                    btnTextStyle:
                        AppStyles.style16Normal.copyWith(color: studyController.selectedOpportunityFlag.value == index ? ColorValues.primaryGreenColor : ColorValues.blackColor),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }

  Widget tipsAndTricksLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.five, left: Dimens.twentyTwo, bottom: Dimens.seven, right: Dimens.twentySix),
      padding: EdgeInsets.only(top: Dimens.thirtyFour, right: Dimens.ten, left: Dimens.twentyNine, bottom: Dimens.ten),
      decoration: BoxDecoration(
        color: ColorValues.whiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.softWhiteColor),
        borderRadius: BorderRadius.only(topRight: Radius.circular(Dimens.twenty), topLeft: Radius.circular(Dimens.twenty)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidgets.autoSizeRichText(textSpans: [
            TextSpan(
              text: StringValues.server.tr,
              style: AppStyles.style16Normal.copyWith(
                color: ColorValues.blackColor,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: StringValues.role.tr,
              style: AppStyles.style16Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ], minFontSize: 10, maxFontSize: 16),
          Flexible(
            child: customListElement(text: StringValues.inThisRoleWhenWeObserveWeAreCountingCovers.tr),
          ),
          Flexible(
            child: customListElement(text: StringValues.coversAreTheNumberOfQuestsThatAreSeatedAtTheTable.tr),
          ),
          CommonWidgets.autoSizeText(
            text: StringValues.processOpportunities.tr,
            textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor, decoration: TextDecoration.underline),
            minFontSize: 10,
            maxFontSize: 16,
          ).marginOnly(top: Dimens.fifteen),
          Flexible(
            child: customListElement(text: StringValues.lookOutForHowServersAreNavigatingAcrossSectionsAreTheyClosingStations.tr),
          ),
          Flexible(
            child: customListElement(text: StringValues.takeNoteOfWhereTheBussingStationsAreCanThisBeImproved.tr),
          ),
          Flexible(
            child: customListElement(text: StringValues.doBussingStationsHaveParStocksOrImagesOfWhatTheSetupShouldLookLike.tr),
          ),
        ],
      ),
    );
  }

  Widget customListElement({required String text, TextStyle? textStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonWidgets.autoSizeText(
          text: '•',
          textStyle: AppStyles.style13Normal.copyWith(color: ColorValues.blackColor),
          minFontSize: 10,
          maxFontSize: 13,
        ).marginOnly(top: Dimens.one, right: Dimens.ten),
        Flexible(
          child: CommonWidgets.autoSizeText(
            text: text,
            textStyle: textStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            minFontSize: 10,
            maxLines: 5,
            maxFontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget operationalAnalysisLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.five, left: Dimens.twentyTwo, bottom: Dimens.seven, right: Dimens.twentySix),
      padding: EdgeInsets.only(top: Dimens.sixTeen),
      decoration: BoxDecoration(
        color: ColorValues.softWhiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
        borderRadius: BorderRadius.only(topRight: Radius.circular(Dimens.twenty), topLeft: Radius.circular(Dimens.twenty)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: Dimens.three),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorValues.deepYellowColor.withOpacity(0.40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Analysis Name',
                    style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
                  ).marginOnly(left: Dimens.twentySeven),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Data Inputs',
                    style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
                  ).marginOnly(left: Dimens.twenty, right: Dimens.fifteen),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Sample',
                    style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
                  ).marginOnly(left: Dimens.twenty, right: Dimens.fifteen),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              double rowHeight = Dimens.sixty;
              int requiredRows = (constraints.maxHeight ~/ rowHeight);
              while (studyController.tableData.length < requiredRows) {
                studyController.tableData.add(OperationalAnalysisDataModel(analysisName: '', dataInputs: '', sample: ''));
              }
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  /// table data
                  Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
                    ),
                    child: ListView.builder(
                      itemCount: studyController.tableData.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: Dimens.sixty,
                          decoration: BoxDecoration(
                            color: index % 2 == 0 ? ColorValues.transparent : ColorValues.whiteColor,
                          ),
                          child: buildTableRow(
                            operationalAnalysisDataModel: studyController.tableData[index],
                          ),
                        );
                      },
                    ),
                  ),

                  /// table divider
                  Row(
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: constraints.maxHeight,
                            color: ColorValues.fontLightGrayColor.withOpacity(0.25),
                            width: Dimens.four,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: constraints.maxHeight,
                            color: ColorValues.fontLightGrayColor.withOpacity(0.25),
                            width: Dimens.four,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildTableRow({required OperationalAnalysisDataModel operationalAnalysisDataModel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            operationalAnalysisDataModel.analysisName,
            style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
          ).marginOnly(left: Dimens.twentySeven),
        ),
        Expanded(
          flex: 1,
          child: Text(
            operationalAnalysisDataModel.dataInputs,
            style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
          ).marginOnly(left: Dimens.twenty, right: Dimens.fifteen),
        ),
        if (operationalAnalysisDataModel.sample.isNotEmpty)
          Expanded(
            flex: 1,
            child: customListElement(
              text: operationalAnalysisDataModel.sample,
              textStyle: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
            ).marginOnly(left: Dimens.twenty, right: Dimens.fifteen),
          ),
      ],
    );
  }

  Widget keyThemesLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.five, left: Dimens.twentyTwo, bottom: Dimens.seven, right: Dimens.twentySix),
      padding: EdgeInsets.only(top: Dimens.thirtyFour, right: Dimens.fifteen, left: Dimens.twentyNine, bottom: Dimens.ten),
      decoration: BoxDecoration(
        color: ColorValues.whiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.softWhiteColor),
        borderRadius: BorderRadius.only(topRight: Radius.circular(Dimens.twenty), topLeft: Radius.circular(Dimens.twenty)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: customListElement(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          ),
          Flexible(
            child: customListElement(text: 'Ut in velit a sapien eleifend dictum.'),
          ),
          Flexible(
            child: customListElement(text: 'Cras convallis leo eu mauris egestas lobortis.'),
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return StudyScreenBottomBar(
      onTapActivitiesButton: () {
        studyController.onChangeTab(1);
      },
      onTapAddButton: () {
        Get.toNamed(AppRoutes.createNewStudy);
      },
      onTapTipsAndTricksButton: () {
        studyController.onChangeTab(2);
      },
      onTapOperationAnalysisButton: () {
        studyController.onChangeTab(3);
      },
      onTapKeyThemesButton: () {
        studyController.onChangeTab(4);
      },
      onTapSubmitButton: () {
        studyController.onSubmitStudy();
      },
    );
  }

  Widget serviceActivitiesLayout() {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.eighteen),
        decoration: BoxDecoration(
          color: ColorValues.softWhiteColor,
          border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
          borderRadius: studyController.servicesTapped.value || studyController.opportunityTapped.value
              ? BorderRadius.circular(Dimens.twenty)
              : BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
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
              margin: EdgeInsets.only(top: studyController.servicesTapped.value ? Dimens.fourteen : Dimens.zero),
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
              child: ClipRRect(
                borderRadius: studyController.servicesTapped.value || studyController.opportunityTapped.value
                    ? BorderRadius.circular(Dimens.twenty)
                    : BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
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
          ],
        ),
      ),
    );
  }

  Widget volumeLayout() {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: Dimens.twenty, left: Dimens.nine, bottom: Dimens.eighteen, right: Dimens.seven),
        decoration: BoxDecoration(
          color: ColorValues.softWhiteColor,
          border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
          borderRadius: studyController.servicesTapped.value || studyController.opportunityTapped.value
              ? BorderRadius.circular(Dimens.twenty)
              : BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
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
              margin: EdgeInsets.only(top: studyController.servicesTapped.value || studyController.opportunityTapped.value ? Dimens.fourteen : Dimens.zero),
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
              child: ClipRRect(
                borderRadius: studyController.servicesTapped.value || studyController.opportunityTapped.value
                    ? BorderRadius.circular(Dimens.twenty)
                    : BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
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
          ],
        ),
      ),
    );
  }

  Widget opportunityThemeLayout() {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.eighteen),
        decoration: BoxDecoration(
          color: ColorValues.softWhiteColor,
          border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
          borderRadius: studyController.opportunityTapped.value
              ? BorderRadius.circular(Dimens.twenty)
              : BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
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
              margin: EdgeInsets.only(top: studyController.opportunityTapped.value ? Dimens.fourteen : Dimens.zero),
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
              child: ClipRRect(
                borderRadius: studyController.opportunityTapped.value
                    ? BorderRadius.circular(Dimens.twenty)
                    : BorderRadius.only(bottomLeft: Radius.circular(Dimens.twenty), bottomRight: Radius.circular(Dimens.twenty)),
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
          ],
        ),
      ),
    );
  }

  Widget studyTimeLineLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.eleven, right: Dimens.nine),
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.fifteen), bottomRight: Radius.circular(Dimens.fifteen)),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: studyController.studyTimeLineData.length,
                padding: EdgeInsets.symmetric(vertical: Dimens.four),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: Dimens.four, bottom: Dimens.five),
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
            ),
          ),
        ],
      ),
    );
  }
}
