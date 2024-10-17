import 'package:galleon_user/modules/manage_position_detail/controller/manage_position_detail_controller.dart';
import 'package:get/get.dart';

class ManagePositionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ManagePositionDetailController.new);
  }
}
