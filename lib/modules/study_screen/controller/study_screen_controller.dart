import 'package:get/get.dart';

import '../model/study_timeline_data_model.dart';

class StudyScreenController extends GetxController {
  Rxn<int> selectedServiceActivities = Rxn<int>();
  Rxn<int> selectedOpportunityTheme = Rxn<int>();
  RxInt selectedVolume = 0.obs;

  RxBool servicesTapped = false.obs;
  RxBool opportunityTapped = false.obs;

  RxBool isStudyStarted = false.obs;

  List<String> serviceActivitiesItems = [
    'answer phone call',
    'complete guest inquiry',
    'export loading',
    'create an estimate',
    'guest meeting',
    'answer phone call 2',
    'complete guest inquiry 2',
    'guest meeting 2',
  ];
  List<String> opportunityThemes = [
    'learn excel',
    'learn export',
    'opportunity 1',
    'opportunity 2 ',
    'Item 1',
    'Item 2',
    "opportunity 3",
    'opportunity 4',
    'Item 3',
  ];
  List<String> volumeItems = [
    '1 7',
    '2 8',
    '3 9',
    '4 1',
    '5 2',
    '6 3',
    '7 4',
    '8 5',
    '9 6',
  ];

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
}
