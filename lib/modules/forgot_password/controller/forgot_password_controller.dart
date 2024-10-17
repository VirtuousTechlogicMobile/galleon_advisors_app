import 'package:flutter/material.dart';
import 'package:galleon_user/helper/database_helper/database_helper.dart';
import 'package:get/get.dart';
import '../../../constant/strings.dart';
import '../../../helper/database_helper/firebase_response_model.dart';
import '../../../helper/validators.dart';
import '../../../utility/utility.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  onResetPassword() async {
    if (emailController.text.trim().isEmpty) {
      AppUtility.showSnackBar(StringValues.pleaseEnterEmail.tr);
    } else if (emailController.text.trim().isNotEmpty && !Validators.isValidEmail(emailController.text)) {
      AppUtility.showSnackBar(StringValues.pleaseEnterValidEmail.tr);
    } else {
      if (await AppUtility.checkNetwork()) {
        FirebaseResponseModel response = await DatabaseHelper.instance.sendPasswordResetEmail(email: emailController.text);
        if (response.isSuccess) {
          AppUtility.showSnackBar(StringValues.aLinkToResetYourPasswordHasBeenSentToYourEmailAddress.tr);
        } else {
          if (response.errorMessage != null) {
            AppUtility.showSnackBar(response.errorMessage!.tr);
          }
        }
      } else {
        AppUtility.showSnackBar(StringValues.noInternetConnectionAreAvailable.tr);
      }
    }
  }
}
