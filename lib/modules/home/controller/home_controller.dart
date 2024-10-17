import 'package:galleon_user/helper/database_helper/firebase_response_model.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../constant/app_states.dart';
import '../../../helper/database_helper/database_helper.dart';
import '../../../routes/app_pages.dart';

class HomeScreenController extends GetxController {
  Future onLogout() async {
    Get.context?.loaderOverlay.show();
    FirebaseResponseModel response = await DatabaseHelper.instance.logoutUser();
    if (response.isSuccess) {
      currentUserRole = null;
      Get.offAllNamed(AppRoutes.login);
    } else {
      if (response.errorMessage != null) {
        AppUtility.showSnackBar(response.errorMessage!.tr);
      }
    }
    Get.context?.loaderOverlay.hide();
  }
}
