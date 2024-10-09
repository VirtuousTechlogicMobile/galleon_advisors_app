import 'package:galleon_user/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(HomeScreenController.new);
  }
}
