import 'package:flutter/cupertino.dart';
import 'package:galleon_user/helper/database_helper/database_helper.dart';
import 'package:galleon_user/helper/storage_handler/storage_getters_setters.dart';
import 'package:galleon_user/modules/create_new_position/model/position_data_model.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../common/custom_dropdown.dart';
import '../../../constant/strings.dart';
import '../../../helper/database_helper/firebase_response_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utility/utility.dart';
import '../../create_new_position/model/program_data_model.dart';
import '../model/department_data_model.dart';

class CreateNewStudyController extends GetxController {
  Rx<DropDownMenuItem?> selectedProgram = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedDept = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedPosition = (null as DropDownMenuItem?).obs;
  RxList<DropDownMenuItem> programDropDownItemsList = <DropDownMenuItem>[].obs;
  RxList<DropDownMenuItem> deptDropDownItemsList = <DropDownMenuItem>[].obs;
  RxList<DropDownMenuItem> positionDropDownItemsList = <DropDownMenuItem>[].obs;

  TextEditingController studyNameController = TextEditingController();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Get.context?.loaderOverlay.show();
    await getProgramsDropDownData();
    await getDeptDropDownData();
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

  onSelectProgramValue(DropDownMenuItem? selectedDropDownItem) {
    selectedProgram.value = selectedDropDownItem;
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

  Future getDeptDropDownData() async {
    if (await AppUtility.checkNetwork()) {
      FirebaseResponseModel<List<DepartmentDataModel>?> departmentData = await DatabaseHelper.instance.getAllDepartmentData();
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
  }

  Future getPositionDropDownData() async {
    Get.context?.loaderOverlay.show();
    if (await AppUtility.checkNetwork()) {
      FirebaseResponseModel<List<PositionDataModel>?> positionData = await DatabaseHelper.instance.getPositionsDataById(departmentIds: selectedDept.value?.itemId);
      if (positionData.data?.isNotEmpty ?? false) {
        positionDropDownItemsList.clear();
        selectedPosition.value = null;
        positionDropDownItemsList.addAll(
          positionData.data!.where((element) => element.positionName != null).map(
            (element) {
              return DropDownMenuItem(itemName: element.positionName!);
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

  Future onCreateStudy() async {
    if (studyNameController.text.isEmpty) {
      AppUtility.showSnackBar(StringValues.pleaseEnterStudyName.tr);
      FocusScope.of(Get.context!).requestFocus();
    } else if (selectedProgram.value == null) {
      AppUtility.showSnackBar(StringValues.pleaseSelectProgram.tr);
    } else if (selectedDept.value == null) {
      AppUtility.showSnackBar(StringValues.pleaseSelectDepartment.tr);
    } else if (selectedPosition.value == null) {
      AppUtility.showSnackBar(StringValues.pleaseSelectPosition.tr);
    } else {
      Get.offNamed(AppRoutes.study);
    }
  }
}
