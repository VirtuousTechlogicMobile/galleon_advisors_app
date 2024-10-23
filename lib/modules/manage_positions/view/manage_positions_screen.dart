import 'package:flutter/material.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/modules/manage_positions/controller/manage_positions_controller.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../theme/get_theme_wise_color.dart';
import '../../../utility/responsive.dart';
import '../components/manage_positions_appbar.dart';

class ManagePositionsScreen extends StatelessWidget {
  ManagePositionsScreen({super.key});

  final managePositionsController = Get.find<ManagePositionsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      body: SafeArea(
        left: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ManagePositionsAppbar(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: Dimens.twentySix, bottom: Dimens.thirteen, right: Dimens.twentyFour, left: Dimens.twentyFour),
                itemCount: managePositionsController.positionsDataList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.managePositionsDetail, parameters: {'positionId': managePositionsController.positionsDataList[index].positionId});
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimens.sevenTeen),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: Dimens.twenty),
                      height: GetResponsiveDimens.hundredTenAndFiftyOne(context),
                      decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.ten)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "${managePositionsController.positionsDataList[index].deptName} - ${managePositionsController.positionsDataList[index].positionName}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
                            ),
                          ),
                          if (managePositionsController.positionsDataList[index].status == 'pending')
                            Icon(
                              Icons.star,
                              size: GetResponsiveDimens.fiftyAndTwentyTwo(context),
                              color: ColorValues.primaryGreenColor,
                            ).marginOnly(left: Dimens.five)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
