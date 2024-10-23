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
import '../../../theme/get_theme_wise_color.dart';
import '../controller/create_new_study_controller.dart';

class NewStudyAppbar extends StatelessWidget {
  NewStudyAppbar({super.key});

  final createNewStudyController = Get.find<CreateNewStudyController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: GetThemeStyles.getStyle16Bold(context)?.copyWith(color: ColorValues.blackColor),
          ).marginOnly(left: GetResponsiveDimens.thirtyAndTwentySix(context)),
          SizedBox(
            width: Get.width / 3.3,
            child: CustomTextField(
              controller: createNewStudyController.studyNameController,
              focusNode: createNewStudyController.studyNameFocusNode,
              fillColor: ColorValues.textFieldLightGrayColor.withOpacity(0.50),
              borderRadius: BorderRadius.circular(GetResponsiveDimens.nineAndEight(context)),
              borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
              contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.nineAndEight(context), horizontal: GetResponsiveDimens.fifteenAndFourteen(context)),
              textStyle: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor.withOpacity(0.50)),
              cursorColor: ColorValues.blackColor,
              maxLines: 1,
            ),
          ).marginOnly(left: GetResponsiveDimens.fortyAndSevenTeen(context)),
          const Spacer(),
          Text(
            '10:49:05 Tue, 30 Apr 24',
            style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
          ),
        ],
      ),
    );
  }
}
