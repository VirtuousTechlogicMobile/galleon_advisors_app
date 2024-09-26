import 'package:galleon_advisors_app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../model/operational_analysis_data_model.dart';
import '../model/study_timeline_data_model.dart';

class StudyScreenController extends GetxController {
  Rxn<int> selectedServiceActivities = Rxn<int>();
  Rxn<int> selectedOpportunityTheme = Rxn<int>();
  RxInt selectedVolume = 0.obs;

  List<String> opportunityFlagList = ['Revenue', 'Cost', 'Employee Satisfaction', 'Safety & Sustainability'];
  Rxn<int> selectedOpportunityFlag = Rxn<int>();

  RxBool servicesTapped = false.obs;
  RxBool opportunityTapped = false.obs;

  RxList<String> studyStartTime = <String>[].obs;
  RxBool isStudyStarted = false.obs;

  RxString selectedTab = 'activities'.obs;
  RxString selectedActivitiesSubTab = ''.obs;

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
  List<String> opportunityThemes = ['learn excel', 'learn export', 'opportunity 1', 'opportunity 2 ', 'Item 1', 'Item 2', "opportunity 3", 'opportunity 4', 'Item 3'];
  List<String> volumeItems = ['1 7', '2 8', '3 9', '4 1', '5 2', '6 3', '7 4', '8 5', '9 6'];

  List<OperationalAnalysisDataModel> tableData = [
    OperationalAnalysisDataModel(analysisName: 'Server Travel Analysis', dataInputs: '•  Capture travel between sections', sample: '<hyperlink to image > or image attachment')
  ];

  onChangeTab(int tabNo) {
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

  onSubmitStudy() {
    // selectedServiceActivities.value = null;
    // selectedOpportunityTheme.value = null;
    servicesTapped.value = false;
    opportunityTapped.value = false;
  }

  List<StudyTimelineDataModel> studyTimeLineData = [
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
    StudyTimelineDataModel(heading: 'Answer Phone Call', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Complete Guest Inquiry', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Export Loading', fromTime: '10:51:14', toTime: '10:51:26', type: 'opp'),
    StudyTimelineDataModel(heading: 'Create An Estimate', fromTime: '10:51:14', toTime: '10:51:26', type: 'service'),
    StudyTimelineDataModel(heading: 'Guest Meeting', fromTime: '10:51:14', toTime: '10:51:26', type: 'opp'),
  ];

  onBackPressed() {
    if (selectedActivitiesSubTab.isNotEmpty) {
      selectedActivitiesSubTab.value = '';
    } else if (selectedServiceActivities.value != null || selectedOpportunityTheme.value != null) {
      selectedServiceActivities.value = null;
      selectedOpportunityTheme.value = null;
      servicesTapped.value = false;
      opportunityTapped.value = false;
    } else {
      Get.back();
    }
  }
}
