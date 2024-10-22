import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../common/custom_dropdown.dart';
import '../../../constant/strings.dart';
import '../../../helper/database_helper/database_helper.dart';
import '../../../helper/database_helper/firebase_response_model.dart';
import '../../../utility/utility.dart';
import '../../create_new_position/model/program_data_model.dart';
import '../../create_new_study/model/department_data_model.dart';
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
  RxList<DropDownMenuItem> programDropDownItemsList = <DropDownMenuItem>[].obs;
  RxList<DropDownMenuItem> deptDropDownItemsList = <DropDownMenuItem>[].obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Get.context?.loaderOverlay.show();
    await getProgramsDropDownData();
    // await getDeptDropDownData();
    Get.context?.loaderOverlay.hide();
  }

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

  Future getProgramsDropDownData() async {
    if (await AppUtility.checkNetwork()) {
      FirebaseResponseModel<List<ProgramDataModel>?> programsData = await DatabaseHelper.instance.getAllProgramsData();
      if (programsData.data != null) {
        programDropDownItemsList.addAll(
          programsData.data!.where((element) => element.programName != null).map(
            (element) {
              return DropDownMenuItem(itemName: element.programName!);
            },
          ).toList(),
        );
      }
    } else {
      AppUtility.showSnackBar(StringValues.noInternetConnectionAreAvailable.tr);
    }
  }
/*
  Future getDeptDropDownData() async {
    if (await AppUtility.checkNetwork()) {
      FirebaseResponseModel<List<DepartmentDataModel>?> departmentData = await DatabaseHelper.instance.getProgramDepartmentData();
      if (departmentData.data != null) {
        deptDropDownItemsList.addAll(
          departmentData.data!.where((element) => element.departmentName != null).map(
            (element) {
              return DropDownMenuItem(itemName: element.departmentName!, itemId: element.id);
            },
          ).toList(),
        );
      }
    } else {
      AppUtility.showSnackBar(StringValues.noInternetConnectionAreAvailable.tr);
    }
  }*/

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
