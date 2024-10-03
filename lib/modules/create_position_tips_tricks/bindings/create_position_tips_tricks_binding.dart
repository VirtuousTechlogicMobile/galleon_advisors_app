import 'package:get/get.dart';

import '../controller/create_position_tips_tricks_controller.dart';

class CreatePositionTipsTricksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreatePositionTipsTricksController.new);
  }
}
