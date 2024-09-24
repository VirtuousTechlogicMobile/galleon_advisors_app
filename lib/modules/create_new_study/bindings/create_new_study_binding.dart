import 'package:galleon_advisors_app/modules/create_new_study/controller/create_new_study_controller.dart';
import 'package:get/get.dart';

class CreateNewStudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreateNewStudyController.new);
  }
}
