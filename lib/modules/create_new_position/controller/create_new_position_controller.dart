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
    DropDownMenuItem(itemIndex: 0, itemName: 'Housekeeping'),
    DropDownMenuItem(itemIndex: 1, itemName: 'Food & Beverage'),
    DropDownMenuItem(itemIndex: 2, itemName: 'Tester'),
    DropDownMenuItem(itemIndex: 3, itemName: 'Developer'),
    DropDownMenuItem(itemIndex: 4, itemName: 'Designer'),
  ];
  List<DropDownMenuItem> templateDropDownItemsList = [
    DropDownMenuItem(itemIndex: 0, itemName: 'Housekeeping'),
    DropDownMenuItem(itemIndex: 1, itemName: 'Food & Beverage'),
    DropDownMenuItem(itemIndex: 2, itemName: 'Tester'),
    DropDownMenuItem(itemIndex: 3, itemName: 'Developer'),
    DropDownMenuItem(itemIndex: 4, itemName: 'Designer'),
  ];
}
