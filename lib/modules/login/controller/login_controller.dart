import 'package:flutter/material.dart';
import 'package:galleon_user/utility/role_permission.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';

import '../../../constant/app_states.dart';

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
}
