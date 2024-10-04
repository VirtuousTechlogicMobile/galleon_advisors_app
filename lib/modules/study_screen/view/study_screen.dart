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
import '../../../utility/responsive.dart';
import '../components/custom_split_slider_widget.dart';
import '../components/list_wheel_scroll_picker.dart';
import '../components/study_screen_appbar.dart';
import '../components/study_screen_components.dart';
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
            StudyScreenAppbar(),
            Expanded(
              child: Obx(
                () => ImageFiltered(
                  enabled: studyController.isDialogOpen.value,
                  imageFilter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: IgnorePointer(
                          ignoring: studyController.selectedStudyTimelinesList.length == 2 && studyController.getCurrentTabIndex() == 0,
                          child: ImageFiltered(
                            enabled: studyController.selectedStudyTimelinesList.length == 2 && studyController.getCurrentTabIndex() == 0,
                            imageFilter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 10,
                            ),
                            child: studyController.getCurrentTabIndex() == 0
                                ? activitiesLayout(context)
                                : studyController.getCurrentTabIndex() == 2
                                    ? tipsAndTricksLayout()
                                    : studyController.getCurrentTabIndex() == 3
                                        ? operationalAnalysisLayout()
                                        : keyThemesLayout(),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: studyTimeLineLayout(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget activitiesLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Flexible(
            child: studyController.selectedActivitiesSubTab.value == 'comment'
                ? commentsLayout(context)
                : studyController.selectedActivitiesSubTab.value == 'opportunityFlag'
                    ? opportunityFlagLayout()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 3,
                            child: serviceActivitiesLayout(context),
                          ),
                          Obx(
                            () => studyController.selectedStudyTimelinesList.isNotEmpty && studyController.selectedStudyTimelinesList.length < 2
                                ? SizedBox(width: Dimens.nine)
                                : Flexible(
                                    flex: 2,
                                    child: volumeLayout(),
                                  ),
                          ),
                          Flexible(
                            flex: 3,
                            child: opportunityThemeLayout(),
                          ),
                        ],
                      ).marginSymmetric(horizontal: Dimens.fourteen),
          ),
        ),

        /// comment & opportunity flag buttons
        Obx(
          () => studyController.selectedStudyTimelinesList.length == 1
              ? splitStudyLayout()
              : ClipRect(
                  child: ImageFiltered(
                    enabled: studyController.selectedStudyTimelinesList.length == 3,
                    imageFilter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: commentOppFlagButtonsLayout(),
                  ),
                ),
        ),
      ],
    );
  }

  Widget splitStudyLayout() {
    return Obx(
      () => CustomSplitSliderWidget(
        sliderValue: studyController.splitSliderValue.value,
        onChangeSliderValue: (value) {
          studyController.splitSliderValue.value = value;
        },
      ),
    );
  }

  Widget commentOppFlagButtonsLayout() {
    return Row(
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
    ).marginOnly(bottom: Dimens.nine);
  }

  Widget commentsLayout(BuildContext context) {
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
                      child: Text(
                        StringValues.comment.tr,
                        style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
                      ),
                    ),
                    Text(
                      'Free Text as well as auto-safe.',
                      style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                    ).marginOnly(top: Dimens.twentySix, left: GetResponsiveDimens.twentyNineAndFifty(context), right: Dimens.forty),
                  ],
                ).marginOnly(top: Dimens.sevenTeen, bottom: Dimens.ten);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: GetResponsiveDimens.sixAndFour(context)),
            decoration: BoxDecoration(border: Border.all(width: GetResponsiveDimens.sixAndFour(context), color: ColorValues.softWhiteColor)),
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
                      child: Text(
                        StringValues.identifier.tr,
                        style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
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

  Widget opportunityFlagLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                      buttonWidth: GetResponsiveDimens.widthDivThreeAndTwoHundredForty(context),
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
      },
    );
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
            child: StudyScreenComponents.customListElement(text: StringValues.inThisRoleWhenWeObserveWeAreCountingCovers.tr),
          ),
          Flexible(
            child: StudyScreenComponents.customListElement(text: StringValues.coversAreTheNumberOfQuestsThatAreSeatedAtTheTable.tr),
          ),
          Text(
            StringValues.processOpportunities.tr,
            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor, decoration: TextDecoration.underline),
          ).marginOnly(top: Dimens.fifteen),
          Flexible(
            child: StudyScreenComponents.customListElement(text: StringValues.lookOutForHowServersAreNavigatingAcrossSectionsAreTheyClosingStations.tr),
          ),
          Flexible(
            child: StudyScreenComponents.customListElement(text: StringValues.takeNoteOfWhereTheBussingStationsAreCanThisBeImproved.tr),
          ),
          Flexible(
            child: StudyScreenComponents.customListElement(text: StringValues.doBussingStationsHaveParStocksOrImagesOfWhatTheSetupShouldLookLike.tr),
          ),
        ],
      ),
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
              while (studyController.tableData.length < (constraints.maxHeight ~/ Dimens.sixty)) {
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
            child: StudyScreenComponents.customListElement(
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
            child: StudyScreenComponents.customListElement(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          ),
          Flexible(
            child: StudyScreenComponents.customListElement(text: 'Ut in velit a sapien eleifend dictum.'),
          ),
          Flexible(
            child: StudyScreenComponents.customListElement(text: 'Cras convallis leo eu mauris egestas lobortis.'),
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Obx(
      () => StudyScreenBottomBar(
        onTapActivitiesButton: () {
          studyController.onChangeTab(1);
        },
        onTapAddButton: () {
          Get.toNamed(AppRoutes.createDualStudy);
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
          if (studyController.selectedStudyTimelinesList.length == 2) {
            studyController.onMergeStudies();
          } else if (studyController.selectedStudyTimelinesList.length == 1) {
            studyController.splitStudies();
          } else {
            studyController.onSubmitStudy();
          }
        },
        isMerge: studyController.selectedStudyTimelinesList.length == 2,
        isSplit: studyController.selectedStudyTimelinesList.length == 1,
      ),
    );
  }

  Widget serviceActivitiesLayout(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: studyController.opportunityTapped.value,
        child: ImageFiltered(
          enabled: studyController.opportunityTapped.value,
          imageFilter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            margin: EdgeInsets.only(top: studyController.servicesTapped.value ? Dimens.seven : Dimens.twenty, bottom: Dimens.eighteen),
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

                      /// applied condition for is study started and if not split and merge
                      isScroll:
                          studyController.isStudyStarted.value && studyController.selectedStudyTimelinesList.length != 1 && studyController.selectedStudyTimelinesList.length != 2,
                      onSelectedItemChanged: (selectedValue) {
                        if (studyController.selectedStudyTimelinesList.isNotEmpty) {
                          studyController.isStudyTimeLineSelected.value = false;
                          studyController.currentSelectedStudyTimeline.value = null;
                          studyController.selectedStudyTimelinesList.clear();
                        }
                        studyController.servicesTapped.value = true;
                        studyController.selectedServiceActivities.value = selectedValue;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget volumeLayout() {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
            top: studyController.servicesTapped.value || studyController.opportunityTapped.value ? Dimens.seven : Dimens.twenty,
            left: Dimens.nine,
            bottom: Dimens.eighteen,
            right: Dimens.seven),
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
      () => IgnorePointer(
        ignoring: studyController.servicesTapped.value,
        child: ImageFiltered(
          enabled: studyController.servicesTapped.value,
          imageFilter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            margin: EdgeInsets.only(top: studyController.opportunityTapped.value ? Dimens.seven : Dimens.twenty, bottom: Dimens.eighteen),
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

                      /// applied condition for is study started and if not split and merge
                      isScroll:
                          studyController.isStudyStarted.value && studyController.selectedStudyTimelinesList.length != 1 && studyController.selectedStudyTimelinesList.length != 2,
                      onSelectedItemChanged: (selectedValue) {
                        if (studyController.selectedStudyTimelinesList.isNotEmpty) {
                          studyController.isStudyTimeLineSelected.value = false;
                          studyController.currentSelectedStudyTimeline.value = null;
                          studyController.selectedStudyTimelinesList.clear();
                        }
                        studyController.opportunityTapped.value = true;
                        studyController.selectedOpportunityTheme.value = selectedValue;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimens.thirty,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
              borderRadius: studyController.servicesTapped.value || studyController.opportunityTapped.value
                  ? BorderRadius.only(topLeft: Radius.circular(Dimens.twenty), topRight: Radius.circular(Dimens.twenty))
                  : BorderRadius.zero,
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
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: studyController.selectedStudyTimelinesList.isNotEmpty ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                  itemCount: studyController.studyTimeLineData.length,
                  itemBuilder: (context, index) {
                    /// apply ignore pointer and image filter when study splitting or merging
                    return IgnorePointer(
                      ignoring: studyController.isStudyTimeLineSelected.value && !studyController.selectedStudyTimelinesList.contains(index),
                      child: InkWell(
                        onTap: () {
                          studyController.onSelectedStudyTimeLine(index);
                        },
                        child: ImageFiltered(
                          enabled: studyController.isStudyTimeLineSelected.value && !studyController.selectedStudyTimelinesList.contains(index),
                          imageFilter: ImageFilter.blur(
                            sigmaX: 15,
                            sigmaY: 15,
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: Dimens.four),
                            decoration: BoxDecoration(
                              color: ColorValues.whiteColor,
                              border: studyController.selectedStudyTimelinesList.length == 2
                                  ? Border(
                                      left: BorderSide(
                                          width: Dimens.four,
                                          color: studyController.selectedStudyTimelinesList.contains(index) ? ColorValues.primaryGreenAccentColor : ColorValues.whiteColor),
                                      right: BorderSide(
                                          width: Dimens.four,
                                          color: studyController.selectedStudyTimelinesList.contains(index) ? ColorValues.primaryGreenAccentColor : ColorValues.whiteColor),
                                    )
                                  : Border(
                                      left: BorderSide(
                                          width: Dimens.four,
                                          color: studyController.currentSelectedStudyTimeline.value == index ? ColorValues.primaryGreenAccentColor : ColorValues.whiteColor),
                                      right: BorderSide(
                                          width: Dimens.four,
                                          color: studyController.currentSelectedStudyTimeline.value == index ? ColorValues.primaryGreenAccentColor : ColorValues.whiteColor),
                                    ),
                            ),
                            child: ImageFiltered(
                              enabled: studyController.isStudyTimeLineSelected.value && !studyController.selectedStudyTimelinesList.contains(index),
                              imageFilter: ImageFilter.blur(
                                sigmaX: 15,
                                sigmaY: 15,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Dimens.thirtyTwo,
                                    height: GetResponsiveDimens.thirtyTwoAndThirtyThree(context),
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
                                        Text(
                                          "${studyController.studyTimeLineData[index].fromTime} - ${studyController.studyTimeLineData[index].toTime} "
                                          "(${AppUtility.getTimeDifference(studyController.studyTimeLineData[index].fromTime, studyController.studyTimeLineData[index].toTime)})",
                                          style: AppStyles.style12Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.80)),
                                          maxLines: 1,
                                        ).marginOnly(bottom: Dimens.three),
                                        Text(
                                          studyController.studyTimeLineData[index].heading,
                                          style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ).paddingOnly(left: Dimens.sixTeen, right: Dimens.eight, top: Dimens.six, bottom: Dimens.six),
                            ),
                          ),
                        ).marginSymmetric(
                            horizontal: studyController.isStudyTimeLineSelected.value && !studyController.selectedStudyTimelinesList.contains(index) ? Dimens.four : Dimens.zero),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
