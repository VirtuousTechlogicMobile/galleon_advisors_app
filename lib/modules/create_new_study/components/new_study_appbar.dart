import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/common/custom_textfield.dart';
import 'package:galleon_advisors_app/constant/assets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:get/get.dart';

import '../../../constant/dimens.dart';

class NewStudyAppbar extends StatelessWidget {
  final TextEditingController studyNameController;
  final String time;

  const NewStudyAppbar({super.key, required this.studyNameController, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Dimens.fifty,
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
            child: CommonWidgets.fromSvg(svgAsset: SvgAssets.backIconOutlined),
          ),
          Text(
            StringValues.createNewStudy.tr,
            style: AppStyles.style16Bold.copyWith(color: ColorValues.blackColor),
          ).marginOnly(left: Dimens.twentySix),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 3.3,
            child: CustomTextField(
              controller: studyNameController,
              fillColor: ColorValues.textFieldLightGrayColor.withOpacity(0.50),
              borderRadius: BorderRadius.circular(Dimens.eight),
              borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
              contentPadding: EdgeInsets.symmetric(vertical: Dimens.eight, horizontal: Dimens.fourteen),
              textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.50)),
              cursorColor: ColorValues.blackColor,
              maxLines: 1,
            ),
          ).marginOnly(left: Dimens.sevenTeen),
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
