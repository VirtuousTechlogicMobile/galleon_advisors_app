import 'package:get/get.dart';

import '../../../common/custom_dropdown.dart';

class CreateNewStudyController extends GetxController {
  Rx<DropDownMenuItem?> selectedProgram = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedDept = (null as DropDownMenuItem?).obs;
  Rx<DropDownMenuItem?> selectedPosition = (null as DropDownMenuItem?).obs;

  List<DropDownMenuItem> programDropDownItemsList = [
    DropDownMenuItem(itemIndex: 0, itemName: 'Program 1'),
    DropDownMenuItem(itemIndex: 1, itemName: 'Program 2'),
    DropDownMenuItem(itemIndex: 2, itemName: 'Program 3'),
    DropDownMenuItem(itemIndex: 3, itemName: 'Program 4'),
    DropDownMenuItem(itemIndex: 4, itemName: 'Program 5'),
  ];
  List<DropDownMenuItem> deptDropDownItemsList = [
    DropDownMenuItem(itemIndex: 0, itemName: 'Department 1'),
    DropDownMenuItem(itemIndex: 1, itemName: 'Department 2'),
    DropDownMenuItem(itemIndex: 2, itemName: 'Department 3'),
    DropDownMenuItem(itemIndex: 3, itemName: 'Department 4'),
    DropDownMenuItem(itemIndex: 4, itemName: 'Department 5'),
  ];
  List<DropDownMenuItem> positionDropDownItemsList = [
    DropDownMenuItem(itemIndex: 0, itemName: 'Position 1'),
    DropDownMenuItem(itemIndex: 1, itemName: 'Position 2'),
    DropDownMenuItem(itemIndex: 2, itemName: 'Position 3'),
    DropDownMenuItem(itemIndex: 3, itemName: 'Position 4'),
    DropDownMenuItem(itemIndex: 4, itemName: 'Position 5'),
  ];
}
