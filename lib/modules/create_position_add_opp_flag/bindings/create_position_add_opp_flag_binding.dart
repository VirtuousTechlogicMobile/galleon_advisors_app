import 'package:get/get.dart';

import '../controller/create_position_add_opp_flag_controller.dart';

class CreatePositionAddOppFlagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreatePositionAddOppFlagController.new);
  }
}
