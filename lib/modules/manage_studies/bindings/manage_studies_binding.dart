import 'package:galleon_user/modules/manage_studies/controller/manage_studies_controller.dart';
import 'package:get/get.dart';

class ManageStudiesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(ManageStudiesController.new);
  }
}
