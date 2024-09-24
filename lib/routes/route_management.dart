import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  /// Welcome ------------------------------------------------------------------
  static void goToLoginScreen() {
    Get.offAllNamed(AppRoutes.login);
  }

  static void goToHomePageScreen() {
    Get.offAllNamed(AppRoutes.home);
  }

  static void goToManageStudiesScreen() {
    Get.offNamed(AppRoutes.manageStudies);
  }

  /// Go to back Page / Close Pages --------------------------------------------

  static void goToBack() {
    Get.back();
  }

  /// --------------------------------------------------------------------------
}
