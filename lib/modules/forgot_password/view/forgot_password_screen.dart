import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/common/custom_textfield.dart';
import 'package:galleon_user/constant/assets.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/modules/forgot_password/controller/forgot_password_controller.dart';
import 'package:get/get.dart';
import '../../../common/common_widgets.dart';
import '../../../constant/dimens.dart';
import '../../../helper/validators.dart';
import '../../../routes/app_pages.dart';
import '../../../utility/responsive.dart';
import '../../../utility/utility.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final forgotPasswordController = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        left: false,
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
                  return Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Center(
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
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                StringValues.email.tr,
                                                style: AppStyles.style16Normal.copyWith(color: ColorValues.primaryGreenColor.withOpacity(0.50)),
                                              ).marginOnly(bottom: Dimens.ten),
                                              CustomTextField(
                                                controller: forgotPasswordController.emailController,
                                                contentPadding: EdgeInsets.symmetric(vertical: Dimens.twelve, horizontal: Dimens.fifteen),
                                                hintText: StringValues.email.tr,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                          CustomPrimaryButton(
                                            btnText: StringValues.resetPassword.tr,
                                            borderRadius: BorderRadius.circular(Dimens.thirty),
                                            btnTextStyle: AppStyles.style20Normal.copyWith(color: ColorValues.whiteColor),
                                            buttonWidth: Responsive.isMobile(context) ? smallConstraints.maxWidth / 1.4 : smallConstraints.maxWidth / 1.8,
                                            contentPadding: EdgeInsets.symmetric(vertical: Dimens.eleven, horizontal: Dimens.twentySix),
                                            margin: EdgeInsets.symmetric(vertical: Dimens.twentyFour),
                                            onTap: () {
                                              if (forgotPasswordController.emailController.text.trim().isEmpty) {
                                                AppUtility.showSnackBar(StringValues.pleaseEnterEmail.tr);
                                              } else if (forgotPasswordController.emailController.text.trim().isNotEmpty &&
                                                  !Validators.isValidEmail(forgotPasswordController.emailController.text)) {
                                                AppUtility.showSnackBar(StringValues.pleaseEnterValidEmail.tr);
                                              } else {
                                                Get.offAllNamed(AppRoutes.home);
                                              }
                                            },
                                          ),
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
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CommonWidgets.fromSvg(svgAsset: SvgAssets.backIconOutlined),
                      ).marginOnly(left: Dimens.sixTeen, top: Dimens.sixTeen),
                    ],
                  );
                }),
              ),
            ),

            /// divider
            Container(
              height: Dimens.five,
              width: Get.width / 3,
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
