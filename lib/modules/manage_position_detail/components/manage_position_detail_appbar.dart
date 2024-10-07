import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../controller/manage_position_detail_controller.dart';

class ManagePositionDetailAppbar extends StatelessWidget {
  ManagePositionDetailAppbar({super.key});

  final managePositionDetailController = Get.find<ManagePositionDetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: Dimens.sevenTeen),
      alignment: Alignment.centerLeft,
      color: ColorValues.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (managePositionDetailController.selectedActivityTab.value != null) {
                managePositionDetailController.selectedActivityTab.value = null;
              } else {
                Get.back();
              }
            },
            child: CommonWidgets.fromSvg(svgAsset: SvgAssets.backIconOutlined),
          ).marginOnly(left: Dimens.twentyFour, right: Dimens.twentyNine),
          Expanded(
            child: Obx(
              () => Text(
                managePositionDetailController.positionData.value?.positionName ?? '',
                style: AppStyles.style18Bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: Dimens.twentyNine),
            height: Dimens.fortyThree,
            width: Dimens.seventyThree,
            decoration: BoxDecoration(color: ColorValues.softGrayColor, borderRadius: BorderRadius.circular(Dimens.eight)),
            alignment: Alignment.center,
            child: Container(
              height: Dimens.thirty,
              width: Dimens.thirty,
              decoration: BoxDecoration(
                color: ColorValues.whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorValues.blackColor.withOpacity(0.12),
                    offset: const Offset(0, 0),
                    blurRadius: 16,
                    spreadRadius: 0,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: CommonWidgets.fromSvg(
                svgAsset: SvgAssets.downloadIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
