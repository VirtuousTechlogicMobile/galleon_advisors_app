import 'package:get/get.dart';

import '../controller/end_study_summary_controller.dart';

class EndStudySummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EndStudySummaryController.new);
  }
}
