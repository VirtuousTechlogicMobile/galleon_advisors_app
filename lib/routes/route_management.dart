import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  /// Welcome ------------------------------------------------------------------
  static void goToLoginScreen() {
    Get.offAllNamed(AppRoutes.login);
  }

  /// Go to back Page / Close Pages --------------------------------------------

  static void goToBack() {
    Get.back();
  }

  /// --------------------------------------------------------------------------
}
