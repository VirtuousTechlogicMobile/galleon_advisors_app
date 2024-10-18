import 'package:galleon_user/helper/database_helper/database_helper.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../common/custom_dropdown.dart';
import '../../../helper/database_helper/firebase_response_model.dart';
import '../../create_new_position/model/program_data_model.dart';

class CreateNewStudyController extends GetxController {
  Rx<DropDownMenuItem?> selectedProgram = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedDept = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedPosition = (null as DropDownMenuItem?).obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Get.context?.loaderOverlay.show();
    await getProgramsDropDownData();
    Get.context?.loaderOverlay.hide();
  }

  RxList<DropDownMenuItem> programDropDownItemsList = <DropDownMenuItem>[].obs;
  List<DropDownMenuItem> deptDropDownItemsList = [
    DropDownMenuItem(itemName: 'Department 1'),
    DropDownMenuItem(itemName: 'Department 2'),
    DropDownMenuItem(itemName: 'Department 3'),
    DropDownMenuItem(itemName: 'Department 4'),
    DropDownMenuItem(itemName: 'Department 5'),
  ];
  List<DropDownMenuItem> positionDropDownItemsList = [
    DropDownMenuItem(itemName: 'Position 1'),
    DropDownMenuItem(itemName: 'Position 2'),
    DropDownMenuItem(itemName: 'Position 3'),
    DropDownMenuItem(itemName: 'Position 4'),
    DropDownMenuItem(itemName: 'Position 5'),
  ];

  Future getProgramsDropDownData() async {
    FirebaseResponseModel<List<ProgramDataModel>?> programsData = await DatabaseHelper.instance.getAllProgramsData();
    if (programsData.data != null) {
      programDropDownItemsList.addAll(programsData.data!.map((element) => DropDownMenuItem(itemName: element.programName ?? '')));
    }
  }
}
