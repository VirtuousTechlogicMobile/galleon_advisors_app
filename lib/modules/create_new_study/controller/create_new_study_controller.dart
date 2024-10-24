import 'package:flutter/cupertino.dart';
import 'package:galleon_user/helper/database_helper/database_helper.dart';
import 'package:galleon_user/helper/sqlite_database_helper/sqlite_database_helper.dart';
import 'package:galleon_user/modules/create_new_position/model/position_data_model.dart';
import 'package:galleon_user/modules/create_new_position/model/task_data_model.dart';
import 'package:galleon_user/modules/create_new_study/model/study_data_model.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../common/custom_dropdown.dart';
import '../../../constant/strings.dart';
import '../../../helper/database_helper/firebase_response_model.dart';
import '../../../helper/storage_handler/storage_data_handler.dart';
import '../../../utility/utility.dart';
import '../../create_new_position/model/program_data_model.dart';
import '../model/department_data_model.dart';

class CreateNewStudyController extends GetxController {
  Rx<DropDownMenuItem?> selectedProgram = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedDept = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedPosition = (null as DropDownMenuItem?).obs;
  List<ProgramDataModel> programsDataList = [];
  RxList<DropDownMenuItem> programDropDownItemsList = <DropDownMenuItem>[].obs;
  RxList<DropDownMenuItem> deptDropDownItemsList = <DropDownMenuItem>[].obs;
  RxList<DropDownMenuItem> positionDropDownItemsList = <DropDownMenuItem>[].obs;
  TextEditingController studyNameController = TextEditingController();
  FocusNode studyNameFocusNode = FocusNode();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Get.context?.loaderOverlay.show();
    await getProgramsDropDownData();
    Get.context?.loaderOverlay.hide();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    selectedProgram.value = null;
    selectedDept.value = null;
    selectedPosition.value = null;
    programDropDownItemsList.clear();
    deptDropDownItemsList.clear();
    positionDropDownItemsList.clear();
    studyNameController.clear();
  }

  onSelectProgramValue(DropDownMenuItem? selectedDropDownItem) async {
    if (selectedDropDownItem != selectedProgram.value) {
      selectedProgram.value = selectedDropDownItem;
      await getDeptDropDownData();
    }
  }

  onSelectDeptValue(DropDownMenuItem? selectedDropDownItem) {
    if (selectedDropDownItem != selectedDept.value) {
      selectedDept.value = selectedDropDownItem;
      getPositionDropDownData();
    }
  }

  onSelectPositionValue(DropDownMenuItem? selectedDropDownItem) {
    selectedPosition.value = selectedDropDownItem;
  }

  Future getProgramsDropDownData() async {
    if (await AppUtility.checkNetwork()) {
      FirebaseResponseModel<List<ProgramDataModel>?> programsData = await ProgramsDatabaseHelper.instance.getAllProgramsData();
      if (programsData.data != null) {
        programsDataList = programsData.data!;
        programDropDownItemsList.addAll(
          programsData.data!.where((element) => element.programName != null).map(
            (element) {
              return DropDownMenuItem(itemId: element.id, itemName: element.programName!);
            },
          ).toList(),
        );
      }
    } else {
      AppUtility.showSnackBar(StringValues.noInternetConnectionAreAvailable.tr);
    }
  }

  Future getDeptDropDownData() async {
    Get.context?.loaderOverlay.show();
    if (await AppUtility.checkNetwork()) {
      if (selectedProgram.value != null && programsDataList.where((element) => selectedProgram.value?.itemId == element.id).first.departmentIds != null) {
        FirebaseResponseModel<List<DepartmentDataModel>?> departmentData = await ProgramsDatabaseHelper.instance
            .getProgramDepartmentData(departmentIds: programsDataList.where((element) => selectedProgram.value?.itemId == element.id).first.departmentIds!);
        if (departmentData.data != null) {
          deptDropDownItemsList.clear();
          selectedDept.value = null;
          deptDropDownItemsList.addAll(
            departmentData.data!.where((element) => element.departmentName != null).map(
              (element) {
                return DropDownMenuItem(itemName: element.departmentName!, itemId: element.id);
              },
            ).toList(),
          );
        }
      } else {
        deptDropDownItemsList.clear();
        selectedDept.value = null;
      }
    } else {
      AppUtility.showSnackBar(StringValues.noInternetConnectionAreAvailable.tr);
    }
    Get.context?.loaderOverlay.hide();
  }

  Future getPositionDropDownData() async {
    Get.context?.loaderOverlay.show();
    if (await AppUtility.checkNetwork()) {
      FirebaseResponseModel<List<PositionDataModel>?> positionData = await ProgramsDatabaseHelper.instance.getPositionsDataById(departmentIds: selectedDept.value?.itemId);
      if (positionData.data?.isNotEmpty ?? false) {
        positionDropDownItemsList.clear();
        selectedPosition.value = null;
        positionDropDownItemsList.addAll(
          positionData.data!.where((element) => element.positionName != null).map(
            (element) {
              return DropDownMenuItem(itemId: element.id, itemName: element.positionName!, itemData: element.taskIds);
            },
          ).toList(),
        );
      } else {
        positionDropDownItemsList.clear();
        selectedPosition.value = null;
      }
    } else {
      AppUtility.showSnackBar(StringValues.noInternetConnectionAreAvailable.tr);
    }
    Get.context?.loaderOverlay.hide();
  }

  Future getAndSetTaskData() async {
    FirebaseResponseModel<List<TaskDataModel>?> response = await ProgramsDatabaseHelper.instance.getTasksById(tasksId: selectedPosition.value?.itemData);
    if (response.data != null) {
      print("mansi : ${response.data?.length}");
    } else {
      if (response.errorMessage != null) {
        AppUtility.showSnackBar(response.errorMessage!);
      }
    }
  }

  Future insertTasksDataInSqlite({required TaskDataModel taskData}) async {
    String docId = DatabaseHelper.instance.getUniqueDocId();
    SqliteDatabaseHelper.instance.insertTasksData(
      taskData: taskData,
    );
  }

  Future insertStudyDataInSqlite() async {
    String? userId = await StorageDataHandler.getUserId();
    String docId = DatabaseHelper.instance.getUniqueDocId();
    SqliteDatabaseHelper.instance.insertStudyData(
      studyData: StudyDataModel(
        id: docId,
        studyName: studyNameController.text,
        lastUpdatedBy: null,
        lastUpdatedAt: null,
        createdAt: DateTime.now(),
        positionId: selectedPosition.value?.itemId,
        departmentId: selectedDept.value?.itemId,
        endTime: null,
        isCompleted: false,
        isRemovedFromApp: false,
        isStarted: false,
        keyThemesFile: '',
        pauseTime: null,
        programId: selectedProgram.value?.itemId,
        startTime: null,
        studyBy: userId,
        studyTaskIds: selectedPosition.value?.itemData,
        studyTimelineId: null,
      ),
    );
  }

  Future onCreateStudy() async {
    Get.context?.loaderOverlay.show();
    if (studyNameController.text.isEmpty) {
      AppUtility.showSnackBar(StringValues.pleaseEnterStudyName.tr);
      studyNameFocusNode.requestFocus();
    } else if (selectedProgram.value == null) {
      AppUtility.showSnackBar(StringValues.pleaseSelectProgram.tr);
    } else if (selectedDept.value == null) {
      AppUtility.showSnackBar(StringValues.pleaseSelectDepartment.tr);
    } else if (selectedPosition.value == null) {
      AppUtility.showSnackBar(StringValues.pleaseSelectPosition.tr);
    } else {
      await getAndSetTaskData();
      // Get.offNamed(AppRoutes.study);
    }
    Get.context?.loaderOverlay.hide();
  }
}
