import 'package:flutter/material.dart';
import 'package:galleon_user/common/common_widgets.dart';
import 'package:galleon_user/common/custom_textfield.dart';
import 'package:galleon_user/constant/assets.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:get/get.dart';
import '../../../constant/dimens.dart';
import '../../../utility/responsive.dart';
import '../controller/create_dual_study_controller.dart';

class CreateDualStudyScreenAppbar extends StatelessWidget {
  CreateDualStudyScreenAppbar({super.key});

  final createNewStudySameProgramController = Get.find<CreateDualStudyController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.only(
          left: Dimens.fourteen,
          top: GetResponsiveDimens.sevenAndNine(context),
          bottom: GetResponsiveDimens.fiveAndSeven(context),
          right: GetResponsiveDimens.thirtyAndTwentyEight(context)),
      color: ColorValues.whiteColor,
      // padding: EdgeInsets.only(left: Dimens.fourteen, top: Dimens.nine, bottom: Dimens.seven, right: Dimens.twentyEight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: CommonWidgets.fromSvg(svgAsset: SvgAssets.closeRoundedIcon).marginOnly(right: Dimens.fourteen),
          ),
          Text(
            '(00:00:00)',
            style: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
            overflow: TextOverflow.ellipsis,
          ).marginOnly(left: Dimens.twenty),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 3.3,
            child: CustomTextField(
              controller: createNewStudySameProgramController.studyNameController,
              fillColor: ColorValues.textFieldLightGrayColor.withOpacity(0.50),
              borderRadius: BorderRadius.circular(Dimens.eight),
              borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
              contentPadding: EdgeInsets.symmetric(vertical: Dimens.eight, horizontal: Dimens.fourteen),
              textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.50)),
              cursorColor: ColorValues.blackColor,
              maxLines: 1,
            ),
          ).marginOnly(left: Dimens.ten),
          const Spacer(),
          Obx(
            () => Text(
              createNewStudySameProgramController.currentTime.value,
              style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            ),
          ),
        ],
      ),
    );
  }
}
