import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreatePositionAddOppAndServiceController extends GetxController {
  TextEditingController positionNameController = TextEditingController();
  TextEditingController opportunityController = TextEditingController();
  RxBool isServiceAddButtonTapped = false.obs;
  RxBool isOppAddButtonTapped = false.obs;
  RxString serviceActivityName = 'Service Activities'.obs;
  RxString opportunityThemeName = 'Opportunity Themes'.obs;
  RxList<String> serviceActivitiesList = ['Dish Load', 'Dish Catch', 'Serve', 'vegetables Load'].obs;
  RxList<String> opportunityThemesList = ['Scheduling', 'Training', 'Layout', 'Communication', 'Equipment', 'Technology'].obs;
  Rxn<int> selectedOpportunityFlag = Rxn<int>();

  addPosition() {
    if (positionNameController.text.trim().isNotEmpty) {
      serviceActivitiesList.insert(0, positionNameController.text);
      positionNameController.clear();
    }
    isServiceAddButtonTapped.value = false;
  }

  addOpportunity() {
    if (opportunityController.text.trim().isNotEmpty) {
      opportunityThemesList.insert(0, opportunityController.text);
      opportunityController.clear();
    }
    isOppAddButtonTapped.value = false;
  }
}
