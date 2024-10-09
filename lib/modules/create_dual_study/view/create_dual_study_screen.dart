import 'package:flutter/material.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/modules/create_dual_study/components/create_dual_study_screen_appbar.dart';
import 'package:get/get.dart';

import '../../../common/custom_dropdown.dart';
import '../../../common/custom_primary_button.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../utility/responsive.dart';
import '../controller/create_dual_study_controller.dart';

class CreateDualStudyScreen extends StatelessWidget {
  CreateDualStudyScreen({super.key});

  final createDualStudyController = Get.find<CreateDualStudyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateDualStudyScreenAppbar(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: Dimens.twentyOne, left: Dimens.fifteen, right: Dimens.fifteen, bottom: Dimens.six),
              padding: EdgeInsets.only(top: Dimens.twentyOne),
              decoration: BoxDecoration(
                color: ColorValues.whiteColor,
                borderRadius: BorderRadius.circular(Dimens.sixTeen),
              ),
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 3.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => CustomDropdown(
                        dropDownItemsList: createDualStudyController.deptDropDownItemsList,
                        hintText: StringValues.department.tr,
                        onItemSelected: (selectedDropDownItem) {
                          createDualStudyController.selectedDept.value = selectedDropDownItem;
                        },
                        selectedItem: createDualStudyController.selectedDept.value,
                      ).marginOnly(bottom: Dimens.eighteen),
                    ),
                    Obx(
                      () => CustomDropdown(
                        dropDownItemsList: createDualStudyController.positionDropDownItemsList,
                        hintText: StringValues.position.tr,
                        onItemSelected: (selectedDropDownItem) {
                          createDualStudyController.selectedPosition.value = selectedDropDownItem;
                        },
                        selectedItem: createDualStudyController.selectedPosition.value,
                      ).marginOnly(bottom: Dimens.eighteen),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            color: ColorValues.whiteColor,
            child: Obx(
              () => CustomPrimaryButton(
                buttonWidth: GetResponsiveDimens.widthDivFourAndTwoHundredForty(context),
                btnText: StringValues.create.tr,
                margin: EdgeInsets.symmetric(vertical: GetResponsiveDimens.tenAndEight(context), horizontal: GetResponsiveDimens.twentyAndFourteen(context)),
                borderRadius: BorderRadius.circular(GetResponsiveDimens.nineAndEight(context)),
                contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.twentyFiveAndTwentyOne(context)),
                buttonColor: createDualStudyController.selectedPosition.value != null && createDualStudyController.selectedDept.value != null
                    ? ColorValues.primaryGreenColor
                    : ColorValues.softGrayColor,
                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                btnTextStyle: AppStyles.style16Normal.copyWith(
                  color: createDualStudyController.selectedPosition.value != null && createDualStudyController.selectedDept.value != null
                      ? ColorValues.whiteColor
                      : ColorValues.blackColor,
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
