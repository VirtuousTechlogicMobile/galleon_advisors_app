import 'package:flutter/material.dart';
import 'package:galleon_user/common/common_widgets.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';
import '../../../constant/assets.dart';
import '../../../constant/dimens.dart';
import '../../../theme/get_theme_wise_color.dart';
import '../../../utility/role_permission.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      body: SafeArea(
        left: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
                  style: GetThemeStyles.getStyle16Normal(context),
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
                  style: GetThemeStyles.getStyle16Normal(context),
                ).marginOnly(left: Dimens.sixTeen),
              ],
            ),
          ).marginOnly(bottom: Dimens.thirty, left: Dimens.eleven),
          if (hasAccessFeature(Features.viewPositions))
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.managePositions);
              },
              child: Row(
                children: [
                  CommonWidgets.fromSvg(svgAsset: SvgAssets.peoplesIcon),
                  Text(
                    StringValues.managePosition.tr,
                    style: GetThemeStyles.getStyle16Normal(context),
                  ).marginOnly(left: Dimens.fifteen),
                ],
              ),
            ).marginOnly(bottom: Dimens.thirty, left: Dimens.nine, right: GetResponsiveDimens.sixtyAndForty(context)),
          GestureDetector(
            onTap: () => homeScreenController.onLogout(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: GetResponsiveDimens.tenAndZero(context)),
              padding: EdgeInsets.all(Dimens.twelve),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorValues.green,
                  width: GetResponsiveDimens.threeAndTwo(context),
                ),
                borderRadius: BorderRadius.circular(
                  GetResponsiveDimens.nineAndSeven(context),
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
                    style: GetThemeStyles.getStyle16Bold(context)?.copyWith(color: ColorValues.primaryGreenColor),
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
