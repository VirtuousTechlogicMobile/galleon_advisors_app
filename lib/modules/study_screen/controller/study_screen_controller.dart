import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/operational_analysis_data_model.dart';
import '../model/study_timeline_data_model.dart';

class StudyScreenController extends GetxController {
  Rxn<int> selectedServiceActivities = Rxn<int>();
  Rxn<int> selectedOpportunityTheme = Rxn<int>();
  RxInt selectedVolume = 0.obs;
  RxInt selectedStudyIndex = 0.obs;
  late FixedExtentScrollController servicesScrollController;
  late FixedExtentScrollController volumeScrollController;
  late FixedExtentScrollController oppThemeScrollController;

  RxString currentTime = ''.obs;
  Timer? timer;
  getCurrentDateTime() {
    currentTime.value = DateFormat('HH:mm:ss EEE, dd MMM yy').format(DateTime.now());
  }

  @override
  void onInit() {
    super.onInit();
    insertVolumeItems();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      getCurrentDateTime();
    });
    servicesScrollController = FixedExtentScrollController(initialItem: selectedServiceActivities.value ?? 0);
    volumeScrollController = FixedExtentScrollController(initialItem: selectedVolume.value);
    oppThemeScrollController = FixedExtentScrollController(initialItem: selectedOpportunityTheme.value ?? 0);
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
    servicesScrollController.dispose();
    volumeScrollController.dispose();
    oppThemeScrollController.dispose();
  }

  RxDouble splitSliderValue = 50.0.obs;

  List<String> opportunityFlagList = ['Revenue', 'Cost', 'Employee Satisfaction', 'Safety & Sustainability'];
  Rxn<int> selectedOpportunityFlag = Rxn<int>();

  RxBool isDialogOpen = false.obs;

  RxBool isStudyTimeLineSelected = false.obs;
  RxList<int> selectedStudyTimelinesList = <int>[].obs;
  Rxn<int> currentSelectedStudyTimeline = Rxn<int>();

  RxBool servicesTapped = false.obs;
  RxBool opportunityTapped = false.obs;

  RxList<String> studyStartTime = <String>[].obs;
  RxBool isStudyStarted = false.obs;

  RxString selectedTab = 'activities'.obs;
  RxString selectedActivitiesSubTab = ''.obs;

  onSelectedStudyTimeLine(int selectedItemIndex) {
    if (isStudyStarted.value && !opportunityTapped.value && !servicesTapped.value) {
      isStudyTimeLineSelected.value = true;
      if (selectedStudyTimelinesList.isNotEmpty) {
        if (currentSelectedStudyTimeline.value == selectedItemIndex) {
          /// if user tapped on same index item ---- split timelines
          selectedStudyTimelinesList.clear();
          selectedStudyTimelinesList.add(selectedItemIndex);
        } else {
          /// if user tapped on another item ---- merge timelines
          selectedStudyTimelinesList.clear();
          selectedStudyTimelinesList.add(selectedItemIndex);
          selectedStudyTimelinesList.add(currentSelectedStudyTimeline.value ?? selectedItemIndex);
        }
      } else {
        /// select 3 items on users tap on study timeline item
        if (selectedItemIndex == 0) {
          selectedStudyTimelinesList.addAll([0, 1, 2]);
        } else if (selectedItemIndex == (studyTimeLineData.length - 1)) {
          selectedStudyTimelinesList.addAll([selectedItemIndex - 2, selectedItemIndex - 1, selectedItemIndex]);
        } else {
          selectedStudyTimelinesList.addAll([selectedItemIndex - 1, selectedItemIndex, selectedItemIndex + 1]);
        }
      }
      currentSelectedStudyTimeline.value = selectedItemIndex;
    }
  }

  List<String> serviceActivitiesItems = [
    'answer phone call',
    'complete guest inquiry',
    'export loading',
    'create an estimate',
    'guest meeting',
    'answer phone call 2',
    'complete guest inquiry 2',
    'guest meeting 2'
  ];
  List<String> dualStudiesList = ['Test', 'Default Study 2', 'Default Study 3', 'Default Study 4'];
  List<String> opportunityThemes = ['learn excel', 'learn export', 'opportunity 1', 'opportunity 2 ', 'Item 1', 'Item 2', "opportunity 3", 'opportunity 4', 'Item 3'];
  List<String> volumeItems = [];

  insertVolumeItems() {
    volumeItems = List.generate(99, (index) {
      int number = index + 1;
      String formattedNumber = number < 10 ? '0$number' : '$number';
      // Add spaces between the digits
      return formattedNumber.split('').join(' ');
    });
  }

  List<OperationalAnalysisDataModel> tableData = [
    OperationalAnalysisDataModel(analysisName: 'Server Travel Analysis', dataInputs: '•  Capture travel between sections', sample: '<hyperlink to image > or image attachment')
  ];

  onChangeStudyIndex() {
    if (selectedStudyIndex.value < (dualStudiesList.length - 1)) {
      selectedStudyIndex.value = selectedStudyIndex.value + 1;
    } else {
      selectedStudyIndex.value = 0;
    }
  }

  onChangeTab(int tabNo) {
    volumeScrollController.animateToItem(selectedVolume.value, duration: const Duration(milliseconds: 100), curve: Curves.linear);
    oppThemeScrollController.animateToItem(selectedOpportunityTheme.value ?? 0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
    switch (tabNo) {
      case 0:
        selectedTab.value = 'activities';
        break;
      case 2:
        selectedTab.value = 'tips&tricks';
        break;
      case 3:
        selectedTab.value = 'operationAnalysis';
        break;
      case 4:
        selectedTab.value = 'keyThemes';
        break;
      default:
        selectedTab.value = 'activities';
    }
  }

  int getCurrentTabIndex() {
    switch (selectedTab.value) {
      case 'activities':
        return 0;
      case 'tips&tricks':
        return 2;
      case 'operationAnalysis':
        return 3;
      case 'keyThemes':
        return 4;
      default:
        return 0;
    }
  }

  onChangeActivitiesSubTab(int tabNo) {
    switch (tabNo) {
      case 0:
        selectedActivitiesSubTab.value = 'comment';
        break;
      case 1:
        selectedActivitiesSubTab.value = 'opportunityFlag';
        break;
      default:
        selectedActivitiesSubTab.value = 'comment';
    }
  }

  onSubmitStudy() async {
    volumeScrollController.animateToItem(selectedVolume.value, duration: const Duration(milliseconds: 100), curve: Curves.linear);
    if (servicesTapped.value) {
      /// if submit value of service
      servicesScrollController.animateToItem(selectedServiceActivities.value ?? 0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
      await Future.delayed(const Duration(milliseconds: 300));
      servicesTapped.value = false;
    } else {
      /// if submit value of opportunity
      oppThemeScrollController.animateToItem(selectedOpportunityTheme.value ?? 0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
      await Future.delayed(const Duration(milliseconds: 300));
      opportunityTapped.value = false;
    }
    if (opportunityTapped.value || servicesTapped.value) {
      servicesTapped.value = false;
      opportunityTapped.value = false;
    }
  }

  RxList<StudyTimelineDataModel> studyTimeLineData = [
    StudyTimelineDataModel(heading: 'Answer Phone Call', fromTime: '10:51:14', toTime: '11:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Complete Guest Inquiry', fromTime: '10:51:26', toTime: '10:52:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Export Loading', fromTime: '10:51:14', toTime: '10:51:26', type: 'opp'),
    StudyTimelineDataModel(heading: 'Create An Estimate', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Guest Meeting', fromTime: '10:51:14', toTime: '10:51:26', type: 'opp'),
    StudyTimelineDataModel(heading: 'Answer Phone Call', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Complete Guest Inquiry', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Export Loading', fromTime: '10:51:14', toTime: '10:51:26', type: 'opp'),
    StudyTimelineDataModel(heading: 'Create An Estimate', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Guest Meeting', fromTime: '10:51:14', toTime: '10:51:26', type: 'opp'),
    StudyTimelineDataModel(heading: 'Answer Phone Call', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Complete Guest Inquiry', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Export Loading', fromTime: '10:51:14', toTime: '10:51:26', type: 'opp'),
    StudyTimelineDataModel(heading: 'Create An Estimate', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Guest Meeting', fromTime: '10:51:14', toTime: '10:51:26', type: 'opp'),
  ].obs;

  onBackPressed() {
    if (selectedActivitiesSubTab.isNotEmpty) {
      selectedActivitiesSubTab.value = '';
    } else if (selectedStudyTimelinesList.isNotEmpty) {
      isStudyTimeLineSelected.value = false;
      currentSelectedStudyTimeline.value = null;
      selectedStudyTimelinesList.clear();
    } else if (servicesTapped.value || opportunityTapped.value) {
      servicesScrollController.animateToItem(selectedServiceActivities.value ?? 0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
      Future.delayed(const Duration(milliseconds: 500)).then(
        (value) {
          servicesTapped.value = false;
          opportunityTapped.value = false;
        },
      );
    } else {
      Get.offNamed(AppRoutes.home);
    }
  }

  onMergeStudies() {
    if (studyTimeLineData[selectedStudyTimelinesList.first].type == studyTimeLineData[selectedStudyTimelinesList.last].type) {
      selectedStudyTimelinesList.sort();
      studyTimeLineData.replaceRange(selectedStudyTimelinesList.first, selectedStudyTimelinesList.last + 1, [
        StudyTimelineDataModel(
          fromTime: studyTimeLineData[selectedStudyTimelinesList.first].fromTime,
          toTime: studyTimeLineData[selectedStudyTimelinesList.last].toTime,
          heading: 'Merged',
          type: studyTimeLineData[selectedStudyTimelinesList.first].type,
        )
      ]);
      studyTimeLineData.refresh();
      isStudyTimeLineSelected.value = false;
      currentSelectedStudyTimeline.value = null;
      selectedStudyTimelinesList.clear();
    } else {
      AppUtility.showSnackBar('Failed to Merge');
    }
  }

  void splitStudies() {
    int index = studyTimeLineData.indexOf(studyTimeLineData[selectedStudyTimelinesList.first]);
    if (index >= studyTimeLineData.length) return;

    int percentage = splitSliderValue.value.toInt();
    StudyTimelineDataModel originalData = studyTimeLineData[index];

    DateFormat timeFormat = DateFormat('HH:mm:ss');
    DateTime fromTime = timeFormat.parse(originalData.fromTime);
    DateTime toTime = timeFormat.parse(originalData.toTime);

    Duration totalDuration = toTime.difference(fromTime);

    // Calculate the split point
    Duration splitDuration = totalDuration * (percentage / 100);

    // Calculate the new times for the two parts
    DateTime splitTime = fromTime.add(splitDuration);

    // Create the two new timeline entries
    StudyTimelineDataModel firstPart = StudyTimelineDataModel(
      heading: originalData.heading,
      fromTime: originalData.fromTime,
      toTime: timeFormat.format(splitTime),
      type: originalData.type,
    );

    StudyTimelineDataModel secondPart = StudyTimelineDataModel(
      heading: originalData.heading,
      fromTime: timeFormat.format(splitTime),
      toTime: originalData.toTime,
      type: originalData.type,
    );

    // Replace the original entry and insert the second part
    studyTimeLineData[index] = firstPart;
    studyTimeLineData.insert(index + 1, secondPart);

    // clear the selected items list and unFocus
    studyTimeLineData.refresh();
    isStudyTimeLineSelected.value = false;
    currentSelectedStudyTimeline.value = null;
    selectedStudyTimelinesList.clear();
  }
}
