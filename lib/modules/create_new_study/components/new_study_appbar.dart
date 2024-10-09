import 'package:flutter/material.dart';
import 'package:galleon_user/common/common_widgets.dart';
import 'package:galleon_user/common/custom_textfield.dart';
import 'package:galleon_user/constant/assets.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';

import '../../../constant/dimens.dart';

class NewStudyAppbar extends StatelessWidget {
  final TextEditingController studyNameController;
  final String time;

  const NewStudyAppbar({super.key, required this.studyNameController, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: ColorValues.whiteColor,
      padding: EdgeInsets.only(
          left: Dimens.fourteen,
          top: GetResponsiveDimens.sevenAndNine(context),
          bottom: GetResponsiveDimens.fiveAndSeven(context),
          right: GetResponsiveDimens.thirtyAndTwentyEight(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: CommonWidgets.fromSvg(svgAsset: SvgAssets.backIconOutlined),
          ),
          Text(
            StringValues.createNewStudy.tr,
            style: AppStyles.style16Bold.copyWith(color: ColorValues.blackColor),
          ).marginOnly(left: Responsive.isMobile(context) ? Dimens.thirty : Dimens.twentySix),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 3.3,
            child: CustomTextField(
              controller: studyNameController,
              fillColor: ColorValues.textFieldLightGrayColor.withOpacity(0.50),
              borderRadius: BorderRadius.circular(Responsive.isMobile(context) ? Dimens.nine : Dimens.eight),
              borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
              contentPadding: Responsive.isMobile(context)
                  ? EdgeInsets.symmetric(vertical: Dimens.nine, horizontal: Dimens.fifteen)
                  : EdgeInsets.symmetric(vertical: Dimens.eight, horizontal: Dimens.fourteen),
              textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.50)),
              cursorColor: ColorValues.blackColor,
              maxLines: 1,
            ),
          ).marginOnly(left: Responsive.isMobile(context) ? Dimens.forty : Dimens.sevenTeen),
          const Spacer(),
          Text(
            time,
            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
          ),
        ],
      ),
    );
  }
}
