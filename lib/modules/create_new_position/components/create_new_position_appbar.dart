import 'package:flutter/material.dart';
import 'package:galleon_user/common/common_widgets.dart';
import 'package:galleon_user/constant/assets.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:get/get.dart';

import '../../../constant/dimens.dart';
import '../../../utility/responsive.dart';

class CreateNewPositionAppbar extends StatelessWidget {
  final String? positionName;
  const CreateNewPositionAppbar({super.key, this.positionName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context) ? 50 : Dimens.fifty,
      width: MediaQuery.sizeOf(context).width,
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(left: Dimens.fourteen, top: Dimens.nine, bottom: Dimens.seven, right: Dimens.twentyEight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: CommonWidgets.fromSvg(svgAsset: SvgAssets.closeRoundedIcon),
          ),
          Text(
            StringValues.createNewPosition.tr,
            style: AppStyles.style16Bold.copyWith(color: ColorValues.blackColor),
          ).marginOnly(left: Dimens.thirtyNine),
          if (positionName != null)
            Text(
              positionName ?? '',
              style: AppStyles.style16Bold.copyWith(color: ColorValues.blackColor),
            ).marginOnly(left: Dimens.fortyEight),
        ],
      ),
    );
  }
}
