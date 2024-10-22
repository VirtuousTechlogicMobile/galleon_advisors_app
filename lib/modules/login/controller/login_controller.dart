import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:galleon_user/utility/role_permission.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';

import '../../../constant/app_states.dart';
import '../../../constant/strings.dart';
import '../../../helper/database_helper/database_helper.dart';
import '../../../helper/database_helper/firebase_response_model.dart';
import '../../../helper/storage_handler/storage_data_handler.dart';
import '../../../helper/validators.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  RxBool isShowPassword = false.obs;

  Future onLogin() async {
    if (emailController.text.trim().isEmpty) {
      AppUtility.showSnackBar(StringValues.pleaseEnterEmail.tr);
    } else if (emailController.text.trim().isNotEmpty && !Validators.isValidEmail(emailController.text)) {
      AppUtility.showSnackBar(StringValues.pleaseEnterValidEmail.tr);
    } else if (passwordController.text.trim().isEmpty) {
      AppUtility.showSnackBar(StringValues.pleaseEnterPassword.tr);
    } else if (passwordController.text.trim().length < 6) {
      AppUtility.showSnackBar(StringValues.passwordMustBeAtLeast6Characters.tr);
    } else {
      if (await AppUtility.checkNetwork()) {
        Get.context?.loaderOverlay.show();
        FirebaseResponseModel<String?> response = await signInUser();
        if (response.isSuccess) {
          if (response.data != null) {
            setCurrentUserRole(response.data!);
            await StorageDataHandler.setUserRole(role: response.data!);
          }
          Get.offAllNamed(AppRoutes.home);
        } else {
          if (response.errorMessage != null) {
            AppUtility.showSnackBar(response.errorMessage!.tr);
          }
        }
        Get.context?.loaderOverlay.hide();
      } else {
        AppUtility.showSnackBar(StringValues.noInternetConnectionAreAvailable.tr);
      }
    }
  }

  Future<FirebaseResponseModel<String?>> signInUser() async {
    return await DatabaseHelper.instance.signInUser(email: emailController.text, password: passwordController.text);
  }
}
