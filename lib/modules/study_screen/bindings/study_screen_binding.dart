import 'package:get/get.dart';

import '../controller/study_screen_controller.dart';

class StudyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(StudyScreenController.new);
  }
}
