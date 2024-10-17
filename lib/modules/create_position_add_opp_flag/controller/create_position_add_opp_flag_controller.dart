import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreatePositionAddOppFlagController extends GetxController {
  RxBool isOppAddButtonTapped = false.obs;
  RxList<String> opportunityFlagList = ['Empty', 'Tech - Developer', 'Food & Beverage - Waiter', 'Food & Beverage - Barista'].obs;
  TextEditingController oppFlagController = TextEditingController();

  addFlag() {
    if (oppFlagController.text.trim().isNotEmpty) {
      opportunityFlagList.insert(0, oppFlagController.text);
      oppFlagController.clear();
    }
    isOppAddButtonTapped.value = false;
  }
}
