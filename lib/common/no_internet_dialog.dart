import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/styles.dart';

class NoInternetDialog {
  static void showNoInternetDialog() {
    closeDialog();
    Get.dialog(
      Scaffold(
        body: Padding(
          padding: Dimens.edgeInsets16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Dimens.screenWidth * 0.75,
                height: Dimens.screenWidth * 0.75,
              ),
              Dimens.boxHeight16,
              Text(
                'No Internet!',
                textAlign: TextAlign.center,
                style: AppStyles.style24Bold.copyWith(
                  color: ColorValues.errorColor,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
      name: 'no_internet_dialog',
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
