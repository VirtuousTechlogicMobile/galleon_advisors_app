import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:galleon_user/common/no_internet_dialog.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool hasInternet = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _connectivity.onConnectivityChanged.listen((result) {
      hasInternet.value = (!result.contains(ConnectivityResult.none));
      if (!hasInternet.value) {
        _showNoInternetDialog();
      } else {
        closeDialog();
      }
    });
  }

  Future<void> _checkInitialConnection() async {
    if (await AppUtility.checkNetwork() == false) {
      _showNoInternetDialog();
    }
  }

  void _showNoInternetDialog() {
    // Ensure that we are showing the dialog after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      closeDialog();
      Get.dialog(
        barrierDismissible: false,
        barrierColor: ColorValues.transparent.withOpacity(0.50),
        transitionCurve: Curves.linear,
        NoInternetDialog.showNoInternetDialog(),
      );
    });
  }

  static void closeDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
