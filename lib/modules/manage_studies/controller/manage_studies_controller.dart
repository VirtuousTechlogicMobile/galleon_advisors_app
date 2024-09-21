import 'package:get/get.dart';

class ManageStudiesController extends GetxController {
  // List of items in the dropdown
  final List<String> items = ["Option 1", "Option 2", "Option 3", "Option 4"];
  //RxString selectedValue = "".obs;
  var selectedValue = ''.obs;
  final listOfDepartment = <String>['Option 1', 'Option 2', 'Option 3'].obs;

  // Method to update the selected value
  void updateListOfValue(String value) {
    selectedValue.value = value;
  }

  void updateValue(String value) {
    selectedValue.value = value; // Update the selected value
  }
}
