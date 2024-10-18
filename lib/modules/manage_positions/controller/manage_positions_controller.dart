import 'package:get/get.dart';

import '../../../common/custom_dropdown.dart';
import '../model/manage_positions_data_model.dart';

class ManagePositionsController extends GetxController {
  Rx<DropDownMenuItem?> selectedDept = (null as DropDownMenuItem?).obs;
  List<DropDownMenuItem> deptDropDownItemsList = [
    DropDownMenuItem(itemName: 'Department 1'),
    DropDownMenuItem(itemName: 'Department 2'),
    DropDownMenuItem(itemName: 'Department 3'),
    DropDownMenuItem(itemName: 'Department 4'),
    DropDownMenuItem(itemName: 'Department 5'),
  ];

  List<ManagePositionsDataModel> positionsDataList = [
    ManagePositionsDataModel(positionId: 'ahgsfd45637', deptName: 'Housekeeping', positionName: 'Houseman', status: 'approved'),
    ManagePositionsDataModel(positionId: '657s6dfssdf', deptName: 'Housekeeping', positionName: 'Supervisor', status: 'approved'),
    ManagePositionsDataModel(positionId: 'jdf5457gf46', deptName: 'Housekeeping', positionName: 'Driver', status: 'approved'),
    ManagePositionsDataModel(positionId: '2s35df4gsf4', deptName: 'Food & Beverage', positionName: 'Server', status: 'pending'),
    ManagePositionsDataModel(positionId: 'sdfwq65754a', deptName: 'Food & Beverage', positionName: 'Waiter', status: 'approved'),
  ];
}
