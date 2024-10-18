import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/custom_dropdown.dart';

class CreateDualStudyController extends GetxController {
  TextEditingController studyNameController = TextEditingController();
  RxString currentTime = ''.obs;
  Timer? timer;
  getCurrentDateTime() {
    currentTime.value = DateFormat('HH:mm:ss EEE, dd MMM yy').format(DateTime.now());
  }

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      getCurrentDateTime();
    });
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }

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

  Rx<DropDownMenuItem?> selectedDept = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedPosition = (null as DropDownMenuItem?).obs;
}
