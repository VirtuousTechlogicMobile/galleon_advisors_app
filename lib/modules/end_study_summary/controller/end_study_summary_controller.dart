import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../model/service_activities_model.dart';

class EndStudySummaryController extends GetxController {
  double servicePer = 23.4;
  double oppPer = 76.6;

  List<String> keyThemesList = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Ut in velit a sapien eleifend dictum.',
    'Cras convallis leo eu mauris egestas lobortis.',
  ];

  List<ServiceActivitiesModel> serviceActivitiesList = [
    ServiceActivitiesModel(activity: 'Complete Guest Inq', timeObserved: '1 min and 20 sec', volume: '23', activityDuration: '2 sec'),
    ServiceActivitiesModel(activity: 'Answer Guest Call', timeObserved: '3 min and 21 sec', volume: '1', activityDuration: '20 min and 10 Seconds'),
    ServiceActivitiesModel(activity: 'Prepare Meeting Ro', timeObserved: '2 min and 20 sec', volume: '16', activityDuration: '3 min and 8 Seconds'),
    ServiceActivitiesModel(activity: 'Answer Guest Call', timeObserved: '5 min and 09 sec', volume: '9', activityDuration: '15 min and 8 Seconds'),
    ServiceActivitiesModel(activity: 'Answer Guest Call', timeObserved: '8 min and 25 sec', volume: '10', activityDuration: '11 min and 6 Seconds'),
  ];

  List<BarChartGroupData> getBarGroups() {
    return [
      BarChartGroupData(
        barsSpace: 0,
        x: 0,
        barRods: [
          BarChartRodData(
            toY: 4800,
            color: ColorValues.charcoalGrayColor,
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),
      BarChartGroupData(
        barsSpace: 0,
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 4400,
            color: ColorValues.charcoalGrayColor,
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),
      BarChartGroupData(
        barsSpace: 0,
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 3250,
            color: ColorValues.charcoalGrayColor,
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),
      BarChartGroupData(
        barsSpace: 0,
        x: 3,
        barRods: [
          BarChartRodData(
            toY: 500,
            color: ColorValues.charcoalGrayColor,
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),
    ];
  }
}
