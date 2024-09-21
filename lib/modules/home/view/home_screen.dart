import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/routes/app_pages.dart';
import 'package:galleon_advisors_app/routes/route_management.dart';
import 'package:get/get.dart';
import '../../../constant/assets.dart';
import '../../../constant/dimens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      body: SafeArea(
        top: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(Dimens.twentyFour),
                decoration: BoxDecoration(
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.circular(Dimens.thirtyTwo),
                ),
                child: Transform.scale(
                  scale: 1.5,
                  child: Image.asset(
                    AssetValues.leftToRightAppLogo,
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: menuLayout()),
          ],
        ),
      ),
    );
  }

  Widget menuLayout() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.twentyFive,
      ),
      decoration: const BoxDecoration(
        color: ColorValues.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                CommonWidgets.fromSvg(svgAsset: SvgAssets.addIcon),
                CommonWidgets.autoSizeText(
                  text: StringValues.newStudy.tr,
                  minFontSize: 12,
                  maxFontSize: 16,
                  textStyle: AppStyles.style16Normal,
                ).marginOnly(left: Dimens.eighteen),
              ],
            ),
          ).marginOnly(bottom: Dimens.thirty, left: Dimens.seven),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.manageStudies);
            },
            child: Row(
              children: [
                CommonWidgets.fromSvg(svgAsset: SvgAssets.folderOutlinedIcon),
                CommonWidgets.autoSizeText(
                  text: StringValues.manageStudies.tr,
                  minFontSize: 12,
                  maxFontSize: 16,
                  textStyle: AppStyles.style16Normal,
                ).marginOnly(left: Dimens.sixTeen),
              ],
            ),
          ).marginOnly(bottom: Dimens.thirty, left: Dimens.seven),
          InkWell(
            child: Row(
              children: [
                CommonWidgets.fromSvg(svgAsset: SvgAssets.peoplesIcon),
                CommonWidgets.autoSizeText(
                  text: StringValues.managePosition.tr,
                  minFontSize: 12,
                  maxFontSize: 16,
                  textStyle: AppStyles.style16Normal,
                ).marginOnly(left: Dimens.ten),
              ],
            ),
          ).marginOnly(bottom: Dimens.thirty, left: Dimens.seven),
          GestureDetector(
            onTap: () {
              RouteManagement.goToLoginScreen();
            },
            child: Container(
              padding: EdgeInsets.all(Dimens.fourteen),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorValues.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.eight,
                  )),
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
