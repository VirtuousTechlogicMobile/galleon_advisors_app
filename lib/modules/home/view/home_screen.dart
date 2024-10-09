import 'package:flutter/material.dart';
import 'package:galleon_user/common/common_widgets.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';

import '../../../constant/assets.dart';
import '../../../constant/dimens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // flex: Responsive.isMobile(context) ? 5 : 3,
            child: Container(
              height: Dimens.screenHeight,
              margin: EdgeInsets.all(Dimens.twentyFour),
              decoration: BoxDecoration(
                color: ColorValues.whiteColor,
                borderRadius: BorderRadius.circular(Dimens.thirtyTwo),
              ),
              child: Responsive.isMobile(context)
                  ? Image.asset(
                      AssetValues.leftToRightAppLogo,
                    ).paddingSymmetric(horizontal: Dimens.hundred)
                  : Transform.scale(
                      scale: 1.5,
                      child: Image.asset(
                        AssetValues.leftToRightAppLogo,
                      ),
                    ),
            ),
          ),
          IntrinsicWidth(child: menuLayout(context)),
        ],
      ),
    );
  }

  Widget menuLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimens.twenty, right: Dimens.thirty),
      decoration: const BoxDecoration(
        color: ColorValues.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.createNewStudy);
            },
            child: Row(
              children: [
                CommonWidgets.fromSvg(svgAsset: SvgAssets.addIcon),
                Text(
                  StringValues.newStudy.tr,
                  style: AppStyles.style16Normal,
                ).marginOnly(left: Dimens.twenty),
              ],
            ),
          ).marginOnly(bottom: Dimens.thirty, left: Dimens.fourteen),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.manageStudies);
            },
            child: Row(
              children: [
                CommonWidgets.fromSvg(svgAsset: SvgAssets.folderOutlinedIcon),
                Text(
                  StringValues.manageStudies.tr,
                  style: AppStyles.style16Normal,
                ).marginOnly(left: Dimens.sixTeen),
              ],
            ),
          ).marginOnly(bottom: Dimens.thirty, left: Dimens.eleven),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.managePositions);
            },
            child: Row(
              children: [
                CommonWidgets.fromSvg(svgAsset: SvgAssets.peoplesIcon),
                Text(
                  StringValues.managePosition.tr,
                  style: AppStyles.style16Normal,
                ).marginOnly(left: Dimens.fifteen),
              ],
            ),
          ).marginOnly(bottom: Dimens.thirty, left: Dimens.nine, right: Responsive.isMobile(context) ? Dimens.sixty : Dimens.forty),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRoutes.login);
            },
            child: Container(
              margin: Responsive.isMobile(context) ? EdgeInsets.symmetric(horizontal: Dimens.ten) : EdgeInsets.zero,
              padding: EdgeInsets.all(Dimens.twelve),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorValues.green,
                  width: Dimens.two,
                ),
                borderRadius: BorderRadius.circular(
                  Dimens.nine,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidgets.fromSvg(
                    svgAsset: SvgAssets.logout,
                    width: Dimens.sixTeen,
                    height: Dimens.sixTeen,
                    boxFit: BoxFit.fill,
                  ),
                  Text(
                    StringValues.logout.tr,
                    style: AppStyles.style16Bold.copyWith(color: ColorValues.primaryGreenColor),
                  ),
                  const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
