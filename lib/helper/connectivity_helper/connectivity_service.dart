import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool hasInternet = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _connectivity.onConnectivityChanged.listen(
      (result) {
        hasInternet.value = (!result.contains(ConnectivityResult.none));
        if (!hasInternet.value) {
          // Show the dialog when there's no internet
          // Get.dialog(NoInternetDialog());
        } else {
          // Close the dialog if internet is back
          if (Get.isDialogOpen == true) {
            Get.back();
          }
        }
      },
    );
  }

  Future<void> _checkInitialConnection() async {
    if (await AppUtility.checkNetwork()) {
      // Get.dialog(NoInternetDialog());
    }
  }
}
