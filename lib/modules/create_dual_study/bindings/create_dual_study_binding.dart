import 'package:get/get.dart';
import '../controller/create_dual_study_controller.dart';

class CreateDualStudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreateDualStudyController.new);
  }
}
