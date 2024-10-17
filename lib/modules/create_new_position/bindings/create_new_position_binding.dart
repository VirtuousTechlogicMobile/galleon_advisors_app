import 'package:get/get.dart';

import '../controller/create_new_position_controller.dart';

class CreateNewPositionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreateNewPositionController.new);
  }
}
