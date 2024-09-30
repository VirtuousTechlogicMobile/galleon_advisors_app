import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/common/custom_textfield.dart';
import 'package:galleon_advisors_app/constant/assets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:get/get.dart';
import '../../../constant/dimens.dart';
import '../controller/create_dual_study_controller.dart';

class CreateDualStudyScreenAppbar extends StatelessWidget {
  CreateDualStudyScreenAppbar({super.key});

  final createNewStudySameProgramController = Get.find<CreateDualStudyController>();

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
            child: CommonWidgets.fromSvg(svgAsset: SvgAssets.closeRoundedIcon).marginOnly(right: Dimens.fourteen),
          ),
          CommonWidgets.autoSizeText(
            text: '(00:00:00)',
            textStyle: AppStyles.style14Normal.copyWith(color: ColorValues.blackColor),
            minFontSize: 12,
            maxFontSize: 16,
          ).marginOnly(left: Dimens.twentySeven),
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
          ).marginOnly(left: Dimens.nine),
          const Spacer(),
          Obx(
            () => CommonWidgets.autoSizeText(
              text: createNewStudySameProgramController.currentTime.value,
              textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
              minFontSize: 12,
              maxFontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
