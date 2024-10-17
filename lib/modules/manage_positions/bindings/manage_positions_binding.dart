import 'package:get/get.dart';

import '../controller/manage_positions_controller.dart';

class ManagePositionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ManagePositionsController.new);
  }
}
