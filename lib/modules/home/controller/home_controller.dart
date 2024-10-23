import 'package:galleon_user/helper/database_helper/firebase_response_model.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../constant/app_states.dart';
import '../../../helper/database_helper/database_helper.dart';
import '../../../helper/storage_handler/storage_data_handler.dart';
import '../../../routes/app_pages.dart';
import '../../../utility/role_permission.dart';

class HomeScreenController extends GetxController {
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getUserRole();
  }

  Future onLogout() async {
    Get.context?.loaderOverlay.show();
    FirebaseResponseModel response = await UserDatabaseHelper.instance.logoutUser();
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

  Future getUserRole() async {
    if (currentUserRole == null) {
      String? userRole = await StorageDataHandler.getUserRole();
      if (userRole != null) {
        setCurrentUserRole(userRole);
      }
    }
  }
}
