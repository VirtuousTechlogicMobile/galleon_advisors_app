import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/custom_dropdown.dart';
import '../model/manage_studies_data_model.dart';

class ManageStudiesController extends GetxController {
  Rxn<int> expandedListTileIndex = Rxn<int>();
  Rxn<String> renameStudyById = Rxn<String>();
  Rx<bool> isDialogOpen = false.obs;
  TextEditingController renameStudyController = TextEditingController();
  RxList<StudyDataModel> selectedStudyCheckBoxIndex = <StudyDataModel>[].obs;
  List<ManageStudiesDataModel> studyData = [
    ManageStudiesDataModel(
      departmentName: 'Food & Beverage',
      positionName: 'Barista',
      studyData: [
        StudyDataModel(
          studyId: '123',
          studyName: 'Test 1',
          isStart: false,
        ),
        StudyDataModel(
          studyId: '54894',
          studyName: 'Test 2',
          isStart: false,
        ),
        StudyDataModel(
          studyId: '32413546',
          studyName: 'Test 3',
          isStart: true,
        ),
      ],
    ),
    ManageStudiesDataModel(
      departmentName: 'Food & Beverage',
      positionName: 'Barista',
      studyData: [
        StudyDataModel(
          studyId: '4ada46da4d',
          studyName: 'Test 1',
          isStart: false,
        ),
        StudyDataModel(
          studyId: 's3d46fs74df',
          studyName: 'Test 2',
          isStart: false,
        ),
      ],
    ),
    ManageStudiesDataModel(
      departmentName: 'Food & Beverage',
      positionName: 'Barista',
      studyData: [
        StudyDataModel(
          studyId: 'a54f41657sdf',
          studyName: 'Test 1',
          isStart: false,
        ),
        StudyDataModel(
          studyId: 'asdf67489789',
          studyName: 'Test 2',
          isStart: false,
        ),
      ],
    ),
    ManageStudiesDataModel(
      departmentName: 'Food & Beverage',
      positionName: 'Barista',
      studyData: [
        StudyDataModel(
          studyId: 'sa5489asd489',
          studyName: 'Test 1',
          isStart: false,
        ),
        StudyDataModel(
          studyId: '478sad',
          studyName: 'Test 2',
          isStart: false,
        ),
      ],
    ),
  ];

  Rx<DropDownMenuItem?> selectedProgram = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedDept = (null as DropDownMenuItem?).obs;

  List<DropDownMenuItem> programDropDownItemsList = [
    DropDownMenuItem(itemName: 'Program 1'),
    DropDownMenuItem(itemName: 'Program 2'),
    DropDownMenuItem(itemName: 'Program 3'),
    DropDownMenuItem(itemName: 'Program 4'),
    DropDownMenuItem(itemName: 'Program 5'),
  ];

  List<DropDownMenuItem> deptDropDownItemsList = [
    DropDownMenuItem(itemName: 'Department 1'),
    DropDownMenuItem(itemName: 'Department 2'),
    DropDownMenuItem(itemName: 'Department 3'),
    DropDownMenuItem(itemName: 'Department 4'),
    DropDownMenuItem(itemName: 'Department 5'),
  ];

  onSelectedAll(int index) {
    if (getTotalUnStartedStudyCount(index) == selectedStudyCheckBoxIndex.length) {
      selectedStudyCheckBoxIndex.clear();
    } else {
      selectedStudyCheckBoxIndex.clear();
      for (int i = 0; i < studyData[index].studyData.length; i++) {
        if (studyData[index].studyData[i].isStart == false) {
          selectedStudyCheckBoxIndex.add(studyData[index].studyData[i]);
        }
      }
    }
  }

  int getTotalUnStartedStudyCount(int index) {
    int count = 0;
    for (int i = 0; i < studyData[index].studyData.length; i++) {
      if (studyData[index].studyData[i].isStart == false) {
        count++;
      }
    }
    return count;
  }

  bool isAnyStartedStudyInList(int index) {
    bool hasStarted = studyData[index].studyData.any((data) => data.isStart == true);
    return hasStarted;
  }

  renameStudyName() {
    if (renameStudyController.text.isEmpty) {
      renameStudyById.value = null;
      renameStudyController.text = '';
    } else {
      //TODO: rename study
      renameStudyById.value = null;
      renameStudyController.text = '';
    }
  }
}
