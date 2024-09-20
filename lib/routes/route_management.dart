import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  /// Welcome ------------------------------------------------------------------
  static void goToWelcomeView() {
    Get.offAllNamed(AppRoutes.welcome);
  }

  /// Go to back Page / Close Pages --------------------------------------------

  static void goToBack() {
    Get.back();
  }

  /// --------------------------------------------------------------------------
}
