import 'package:flutter/material.dart';
import 'package:galleon_user/utility/role_permission.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';

import '../../../constant/app_states.dart';
import '../../../constant/strings.dart';
import '../../../helper/database_helper/database_helper.dart';
import '../../../helper/database_helper/firebase_response_model.dart';
import '../../../helper/validators.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  RxBool isShowPassword = false.obs;

  bool setUserRole() {
    if (emailController.text == 'admin@gmail.com') {
      currentUserRole = UserRole.admin;
      return true;
    } else if (emailController.text == 'client@gmail.com') {
      currentUserRole = UserRole.client;
      return true;
    } else if (emailController.text == 'manager@gmail.com') {
      currentUserRole = UserRole.manager;
      return true;
    } else if (emailController.text == 'consultant@gmail.com') {
      currentUserRole = UserRole.consultant;
      return true;
    } else {
      return false;
    }
  }

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
      await signInUser();
      bool loginUser = setUserRole();
      if (loginUser) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        AppUtility.showSnackBar('invalid email');
      }
    }
  }

  Future signInUser() async {
    FirebaseResponseModel signInResponse = await DatabaseHelper.instance.signInUser(email: emailController.text, password: passwordController.text);
  }
}
