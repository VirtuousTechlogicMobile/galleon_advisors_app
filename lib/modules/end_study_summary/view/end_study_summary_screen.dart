import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/modules/end_study_summary/controller/end_study_summary_controller.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../../study_screen/components/study_screen_components.dart';
import '../components/end_study_summary_screen_appbar.dart';

class EndStudySummaryScreen extends StatelessWidget {
  final String studyId;
  EndStudySummaryScreen({super.key, required this.studyId});

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
              onEndButtonTap: () {
                Get.toNamed(AppRoutes.study);
              },
              isShowEndButton: studyId.isNotEmpty,
            ),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 4,
                    child: Column(
                      children: [
                        serviceVsOppLayout(),
                        Expanded(
                          child: chartLayout(),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 5,
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
              ).paddingOnly(bottom: Dimens.eight, left: Dimens.fourteen, right: Dimens.sixTeen),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceVsOppLayout() {
    return Container(
      margin: EdgeInsets.only(
        top: Dimens.twenty,
      ),
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
                    child: Text(
                      "(${endStudySummaryController.servicePer.toStringAsFixed(1)}%)",
                      style: AppStyles.style12Normal.copyWith(
                        color: ColorValues.whiteColor,
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth * (endStudySummaryController.oppPer / 100),
                    padding: EdgeInsets.symmetric(vertical: Dimens.nine),
                    alignment: Alignment.center,
                    color: ColorValues.charcoalGrayColor,
                    child: Text(
                      "(${endStudySummaryController.oppPer.toStringAsFixed(1)}%)",
                      style: AppStyles.style12Normal.copyWith(
                        color: ColorValues.whiteColor,
                      ),
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
        color: ColorValues.whiteColor,
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
            margin: EdgeInsets.all(Dimens.four),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: Dimens.one),
            color: ColorValues.primaryGreenColor.withOpacity(0.25),
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
              color: ColorValues.primaryGreenColor.withOpacity(0.25),
            ),
            child: Text(
              StringValues.serviceActivities.tr,
              style: AppStyles.style14Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ),
          Flexible(
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Column(
                    children: [
                      /// table header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(right: Dimens.eight, top: Dimens.eight, bottom: Dimens.eight),
                              color: ColorValues.primaryGreenColor.withOpacity(0.25),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: Dimens.one, bottom: Dimens.one, left: Dimens.nine),
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
                              margin: EdgeInsets.only(right: Dimens.eight, top: Dimens.eight, bottom: Dimens.eight, left: Dimens.four),
                              color: ColorValues.primaryGreenColor.withOpacity(0.25),
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
                              margin: EdgeInsets.only(right: Dimens.eight, top: Dimens.eight, bottom: Dimens.eight, left: Dimens.four),
                              color: ColorValues.primaryGreenColor.withOpacity(0.25),
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
                              margin: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.eight, left: Dimens.four),
                              color: ColorValues.primaryGreenColor.withOpacity(0.25),
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

                      /// table data
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              endStudySummaryController.serviceActivitiesList.length,
                              (index) {
                                return buildRow(
                                  activity: endStudySummaryController.serviceActivitiesList[index].activity,
                                  timeObserved: endStudySummaryController.serviceActivitiesList[index].timeObserved,
                                  activityDuration: endStudySummaryController.serviceActivitiesList[index].activityDuration,
                                  volume: endStudySummaryController.serviceActivitiesList[index].volume,
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  /// table divider
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
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
                        flex: 2,
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
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: constraints.maxHeight,
                            color: ColorValues.fontLightGrayColor.withOpacity(0.25),
                            width: Dimens.four,
                          ),
                        ),
                      ),
                      const Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  Widget buildRow({required String activity, required String timeObserved, required String volume, required String activityDuration}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            activity,
            style: AppStyles.style16Normal.copyWith(
              color: ColorValues.blackColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).marginOnly(left: Dimens.twelve),
        ),
        Expanded(
          flex: 2,
          child: Text(
            timeObserved,
            style: AppStyles.style16Normal.copyWith(
              color: ColorValues.blackColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).marginOnly(left: Dimens.twelve),
        ),
        Expanded(
          flex: 1,
          child: Text(
            volume,
            style: AppStyles.style16Normal.copyWith(
              color: ColorValues.blackColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).marginOnly(left: Dimens.twelve),
        ),
        Expanded(
          flex: 2,
          child: Text(
            activityDuration,
            style: AppStyles.style16Normal.copyWith(
              color: ColorValues.blackColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).marginOnly(left: Dimens.twelve),
        ),
      ],
    ).marginOnly(bottom: Dimens.ten);
  }

  Widget chartLayout() {
    return Container(
      margin: EdgeInsets.only(top: Dimens.sixTeen),
      decoration: BoxDecoration(
        color: ColorValues.whiteColor,
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
            width: double.infinity,
            margin: EdgeInsets.only(top: Dimens.four, bottom: Dimens.twentyFive, left: Dimens.four, right: Dimens.four),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: Dimens.one),
            color: ColorValues.primaryGreenColor.withOpacity(0.25),
            child: Text(
              StringValues.opportunityThemes.tr,
              style: AppStyles.style14Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  drawHorizontalLine: true,
                  horizontalInterval: 1000,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: ColorValues.chartDividerGreyColor,
                      strokeWidth: Dimens.two,
                    );
                  },
                ),
                alignment: BarChartAlignment.spaceAround,
                maxY: 5000,
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: Dimens.fiftyFive,
                      interval: 1000,
                      getTitlesWidget: (value, _) {
                        switch (value.toInt()) {
                          case 0:
                            return Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Leisure\nArrival',
                                style: AppStyles.style12Normal.copyWith(color: ColorValues.blackColor),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          case 1:
                            return Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Lorem\nIpsum',
                                style: AppStyles.style12Normal.copyWith(color: ColorValues.blackColor),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          case 2:
                            return Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Sched-\nling',
                                textAlign: TextAlign.center,
                                style: AppStyles.style12Normal.copyWith(color: ColorValues.blackColor),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          case 3:
                            return Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Test',
                                style: AppStyles.style12Normal.copyWith(color: ColorValues.blackColor),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1000,
                      getTitlesWidget: (value, _) => Text('${value.toInt()}'),
                    ),
                  ),
                  topTitles: const AxisTitles(),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: Dimens.fortySix,
                      interval: 1000,
                      getTitlesWidget: (value, _) {
                        return Text(
                          '${(value / 5000 * 100).round()} %',
                          style: AppStyles.style12Normal.copyWith(color: ColorValues.blackColor),
                        ).marginOnly(left: Dimens.six);
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    top: BorderSide(color: ColorValues.chartDividerGreyColor, width: Dimens.two),
                    left: BorderSide(color: ColorValues.blackColor, width: Dimens.four),
                    right: BorderSide(color: ColorValues.blackColor, width: Dimens.four),
                    bottom: BorderSide(color: ColorValues.blackColor, width: Dimens.onePointFive),
                  ),
                ),
                barGroups: endStudySummaryController.getBarGroups(),
              ),
            ).marginOnly(left: Dimens.eight, right: Dimens.eight),
          ),
        ],
      ).marginOnly(bottom: Dimens.twentySeven),
    );
  }
}
