import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/custom_dropdown.dart';

class CreateNewPositionController extends GetxController {
  Rx<DropDownMenuItem?> selectedDept = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedTemp = (null as DropDownMenuItem?).obs;
  TextEditingController positionController = TextEditingController();
  RxString positionText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen for changes in the positionController's text
    positionController.addListener(() {
      positionText.value = positionController.text;
    });
  }

  @override
  void onClose() {
    // Clean up the controller when it's disposed
    positionController.dispose();
    super.onClose();
  }

  List<DropDownMenuItem> deptDropDownItemsList = [
    DropDownMenuItem(itemName: 'Housekeeping'),
    DropDownMenuItem(itemName: 'Food & Beverage'),
    DropDownMenuItem(itemName: 'Tester'),
    DropDownMenuItem(itemName: 'Developer'),
    DropDownMenuItem(itemName: 'Designer'),
  ];
  List<DropDownMenuItem> templateDropDownItemsList = [
    DropDownMenuItem(itemName: 'Housekeeping'),
    DropDownMenuItem(itemName: 'Food & Beverage'),
    DropDownMenuItem(itemName: 'Tester'),
    DropDownMenuItem(itemName: 'Developer'),
    DropDownMenuItem(itemName: 'Designer'),
  ];
}
