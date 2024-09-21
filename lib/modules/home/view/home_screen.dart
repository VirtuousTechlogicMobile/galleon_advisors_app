import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/generated/assets.dart';
import 'package:galleon_advisors_app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../constant/assets.dart';
import '../../../constant/dimens.dart';
import '../../../routes/app_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.oneHundredTwentyFive,
                vertical: Dimens.oneHundredFortySeven,
              ),
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: ColorValues.whiteColor,
                borderRadius: BorderRadius.circular(
                  Dimens.thirtyTwo,
                ),
              ),
              child: Image.asset(
                AssetValues.aapLogo,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.twentyFive,
              ),
              decoration: const BoxDecoration(
                color: ColorValues.whiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.ten),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            color: ColorValues.blackColor,
                          ),
                          Dimens.boxWidth20,
                          Text(
                            StringValues.newStudy.tr,
                            style: AppStyles.style16Black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.manageStudies);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.ten),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.folder_copy_outlined,
                            color: ColorValues.blackColor,
                          ),
                          Dimens.boxWidth20,
                          Text(
                            StringValues.manageStudies.tr,
                            style: AppStyles.style16Black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.ten),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.groups_outlined,
                            color: ColorValues.blackColor,
                          ),
                          Dimens.boxWidth20,
                          Text(
                            StringValues.managePosition.tr,
                            style: AppStyles.style16Black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Dimens.boxHeight16,
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(Dimens.twelve),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorValues.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            Dimens.eight,
                          )),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            SvgAssets.logout,
                          ),
                          Dimens.boxWidth24,
                          Text(
                            StringValues.logout.tr,
                            style: AppStyles.style24Bold.copyWith(color: ColorValues.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
