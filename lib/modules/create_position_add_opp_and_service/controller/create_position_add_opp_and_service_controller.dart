import 'package:get/get.dart';

import '../../manage_positions/model/manage_positions_data_model.dart';

class CreatePositionAddOppAndServiceController extends GetxController {
  Rx<ManagePositionsDataModel?> positionData = (null as ManagePositionsDataModel?).obs;
  List<String> opportunityFlagList = ['Empty', 'Tech - Developer', 'Food & Beverage - Waiter', 'Food & Beverage - Barista'];
  Rxn<int> selectedOpportunityFlag = Rxn<int>();

  getPositionData(positionId) {
    positionData.value = ManagePositionsDataModel(
        positionId: positionId,
        positionName: 'Position Name',
        serviceActivities: ["Dish Load", "Dish Catch", "Serve Food", "Manage Tables"],
        oppThemes: ["Training", "Communication", "Food Loading", "Management"],
        status: 'approved');
  }
}
