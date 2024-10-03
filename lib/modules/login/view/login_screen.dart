import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/common/custom_textfield.dart';
import 'package:galleon_advisors_app/constant/assets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/modules/login/controller/login_controller.dart';
import 'package:get/get.dart';
import '../../../common/textfield_with_label.dart';
import '../../../constant/dimens.dart';
import '../../../helper/validators.dart';
import '../../../routes/app_pages.dart';
import '../../../utility/utility.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: Dimens.thirtyTwo, right: Dimens.thirtyTwo, top: Dimens.thirtyTwo),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.thirtyTwo),
                  color: ColorValues.whiteColor,
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: constraints.maxWidth / 18,
                              ),
                              Flexible(
                                flex: 1,
                                child: Image.asset(AssetValues.appLogoImage),
                              ),
                              SizedBox(
                                width: constraints.maxWidth / 9,
                              ),
                              Flexible(
                                flex: 1,
                                child: LayoutBuilder(builder: (context, smallConstraints) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFieldWithLabel(
                                        labelText: StringValues.email.tr,
                                        focusNode: loginController.emailNode,
                                        textField: CustomTextField(
                                          controller: loginController.emailController,
                                          focusNode: loginController.emailNode,
                                          contentPadding: EdgeInsets.symmetric(vertical: Dimens.twelve, horizontal: Dimens.fifteen),
                                          hintText: StringValues.email.tr,
                                          maxLines: 1,
                                        ),
                                      ),
                                      TextFieldWithLabel(
                                        labelText: StringValues.password.tr,
                                        focusNode: loginController.passwordNode,
                                        textField: Obx(
                                          () => CustomTextField(
                                            controller: loginController.passwordController,
                                            focusNode: loginController.passwordNode,
                                            contentPadding: EdgeInsets.symmetric(vertical: Dimens.twelve, horizontal: Dimens.fifteen),
                                            hintText: StringValues.password.tr,
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                loginController.isShowPassword.value = !loginController.isShowPassword.value;
                                              },
                                              child: loginController.isShowPassword.value
                                                  ? CommonWidgets.fromSvg(svgAsset: SvgAssets.eyeOpenIcon)
                                                  : CommonWidgets.fromSvg(svgAsset: SvgAssets.eyeClosedIcon),
                                            ),
                                            obscureText: !loginController.isShowPassword.value,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ).marginOnly(top: Dimens.twentyFour),
                                      CustomPrimaryButton(
                                        btnText: StringValues.logIn.tr,
                                        buttonWidth: Dimens.oneHundredFiftyEight,
                                        borderRadius: BorderRadius.circular(Dimens.thirty),
                                        btnTextStyle: AppStyles.style20Normal.copyWith(color: ColorValues.whiteColor),
                                        contentPadding: EdgeInsets.symmetric(vertical: Dimens.twelve),
                                        margin: EdgeInsets.symmetric(vertical: Dimens.twentyFour),
                                        onTap: () {
                                          if (loginController.emailController.text.trim().isEmpty) {
                                            AppUtility.showSnackBar(StringValues.pleaseEnterEmail.tr);
                                          } else if (loginController.emailController.text.trim().isNotEmpty && !Validators.isValidEmail(loginController.emailController.text)) {
                                            AppUtility.showSnackBar(StringValues.pleaseEnterValidEmail.tr);
                                          } else if (loginController.passwordController.text.trim().isEmpty) {
                                            AppUtility.showSnackBar(StringValues.pleaseEnterPassword.tr);
                                          } else if (loginController.passwordController.text.trim().length < 6) {
                                            AppUtility.showSnackBar(StringValues.passwordMustBeAtLeast6Characters.tr);
                                          } else {
                                            Get.offAllNamed(AppRoutes.home);
                                          }
                                        },
                                      ),
                                      Text(
                                        StringValues.forgotPassword.tr,
                                        style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor, decoration: TextDecoration.underline),
                                      )
                                    ],
                                  );
                                }),
                              ),
                              SizedBox(
                                width: constraints.maxWidth / 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).viewInsets.bottom,
                          ),
                        ],
                      ).marginOnly(top: Dimens.twenty, bottom: Dimens.twenty),
                    ),
                  );
                }),
              ),
            ),

            /// divider
            Container(
              height: Dimens.five,
              width: MediaQuery.sizeOf(context).width / 3,
              margin: EdgeInsets.only(top: Dimens.eleven, bottom: Dimens.sixTeen),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.ten),
                color: ColorValues.dividerBlackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
