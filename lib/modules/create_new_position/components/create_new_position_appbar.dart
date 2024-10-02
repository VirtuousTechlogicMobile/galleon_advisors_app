import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/common/custom_textfield.dart';
import 'package:galleon_advisors_app/constant/assets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:get/get.dart';

import '../../../constant/dimens.dart';

class CreateNewPositionAppbar extends StatelessWidget {
  const CreateNewPositionAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.fifty,
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
          CommonWidgets.autoSizeText(
            text: StringValues.createNewStudy.tr,
            textStyle: AppStyles.style16Bold.copyWith(color: ColorValues.blackColor),
            minFontSize: 12,
            maxFontSize: 16,
          ).marginOnly(left: Dimens.twentySix),
        ],
      ),
    );
  }
}
