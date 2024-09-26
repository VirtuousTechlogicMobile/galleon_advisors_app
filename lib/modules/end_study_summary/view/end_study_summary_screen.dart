import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/modules/end_study_summary/controller/end_study_summary_controller.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';
import '../../study_screen/components/study_screen_components.dart';
import '../components/end_study_summary_screen_appbar.dart';

class EndStudySummaryScreen extends StatelessWidget {
  EndStudySummaryScreen({super.key});

  final endStudySummaryController = Get.find<EndStudySummaryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EndStudySummaryScreenAppbar(
              time: '(03:11:42)',
              programName: 'Test',
              onEndButtonTap: () {},
            ),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: serviceVsOppLayout(),
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: keyThemesLayout(),
                        ),
                        Expanded(
                          flex: 2,
                          child: serviceActivitiesLayout(),
                        ),
                      ],
                    ).marginOnly(left: Dimens.thirteen),
                  ),
                ],
              ),
            ),
          ],
        ).paddingOnly(top: Dimens.twenty, bottom: Dimens.eight, left: Dimens.fourteen, right: Dimens.sixTeen),
      ),
    );
  }

  Widget serviceVsOppLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.eighteen),
      decoration: BoxDecoration(
        color: ColorValues.softWhiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: Dimens.one),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
              color: ColorValues.primaryGreenColor.withOpacity(0.25),
            ),
            child: Text(
              StringValues.serviceVsOpportunity.tr,
              style: AppStyles.style14Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  Container(
                    width: constraints.maxWidth * (endStudySummaryController.servicePer / 100),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: Dimens.nine),
                    color: ColorValues.deepGreenColor,
                    child: CommonWidgets.autoSizeText(
                      text: "(${endStudySummaryController.servicePer.toStringAsFixed(1)}%)",
                      textStyle: AppStyles.style12Normal.copyWith(
                        color: ColorValues.whiteColor,
                      ),
                      maxFontSize: 12,
                      minFontSize: 8,
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth * (endStudySummaryController.oppPer / 100),
                    padding: EdgeInsets.symmetric(vertical: Dimens.nine),
                    alignment: Alignment.center,
                    color: ColorValues.charcoalGrayColor,
                    child: CommonWidgets.autoSizeText(
                      text: "(${endStudySummaryController.oppPer.toStringAsFixed(1)}%)",
                      textStyle: AppStyles.style12Normal.copyWith(
                        color: ColorValues.whiteColor,
                      ),
                      maxFontSize: 12,
                      minFontSize: 8,
                    ),
                  ),
                ],
              );
            },
          ).marginSymmetric(vertical: Dimens.eight, horizontal: Dimens.five),
        ],
      ),
    );
  }

  Widget keyThemesLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.nineteen),
      decoration: BoxDecoration(
        color: ColorValues.softWhiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: Dimens.one),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
              color: ColorValues.primaryGreenColor.withOpacity(0.25),
            ),
            child: Text(
              StringValues.keyThemes.tr,
              style: AppStyles.style14Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.five, left: Dimens.fifteen, right: Dimens.thirty, bottom: Dimens.five),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    endStudySummaryController.keyThemesList.length,
                    (index) {
                      return Flexible(
                        child: StudyScreenComponents.customListElement(text: endStudySummaryController.keyThemesList[index]),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceActivitiesLayout() {
    return Container(
      decoration: BoxDecoration(
        color: ColorValues.softWhiteColor,
        border: Border.all(width: Dimens.four, color: ColorValues.whiteColor),
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: Dimens.one),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor)),
              color: ColorValues.primaryGreenColor.withOpacity(0.25),
            ),
            child: Text(
              StringValues.serviceActivities.tr,
              style: AppStyles.style14Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: Dimens.one, bottom: Dimens.one, left: Dimens.nine),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                      right: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                      top: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                    ),
                    color: ColorValues.primaryGreenColor.withOpacity(0.25),
                  ),
                  child: Text(
                    StringValues.activity.tr,
                    style: AppStyles.style14Normal.copyWith(
                      color: ColorValues.blackColor,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: Dimens.one, bottom: Dimens.one, left: Dimens.nine),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                      right: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                      top: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                    ),
                    color: ColorValues.primaryGreenColor.withOpacity(0.25),
                  ),
                  child: Text(
                    StringValues.timeObserved.tr,
                    style: AppStyles.style14Normal.copyWith(
                      color: ColorValues.blackColor,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: Dimens.one, bottom: Dimens.one, left: Dimens.nine),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                      right: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                      top: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                    ),
                    color: ColorValues.primaryGreenColor.withOpacity(0.25),
                  ),
                  child: Text(
                    StringValues.volume.tr,
                    style: AppStyles.style14Normal.copyWith(
                      color: ColorValues.blackColor,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: Dimens.one, bottom: Dimens.one, left: Dimens.nine),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                      right: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                      top: BorderSide(width: Dimens.four, color: ColorValues.whiteColor),
                    ),
                    color: ColorValues.primaryGreenColor.withOpacity(0.25),
                  ),
                  child: Text(
                    StringValues.activityDuration.tr,
                    style: AppStyles.style14Normal.copyWith(
                      color: ColorValues.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
