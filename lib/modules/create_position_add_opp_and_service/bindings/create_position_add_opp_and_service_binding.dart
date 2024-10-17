import 'package:get/get.dart';
import '../controller/create_position_add_opp_and_service_controller.dart';

class CreatePositionAddOppAndServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreatePositionAddOppAndServiceController.new);
  }
}
