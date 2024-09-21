import 'package:get/get.dart';

class ManageStudiesController extends GetxController {
  // List of items in the dropdown
  final List<String> items = ["Option 1", "Option 2", "Option 3", "Option 4"];
  //RxString selectedValue = "".obs;
  var selectedValue = ''.obs;
  RxBool isChecked = false.obs;
  final listOfDepartment = <String>['Option 1', 'Option 2', 'Option 3'].obs;

  void updateValue(String value) {
    selectedValue.value = value; // Update the selected value
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  void toggleSelectAll(bool? value) {
    isChecked.value = value ?? false;
  }

  //bool get areAllChecked => isChecked1.value && isChecked2.value;
}
