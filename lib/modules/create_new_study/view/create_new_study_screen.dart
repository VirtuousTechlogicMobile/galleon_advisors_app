import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/modules/create_new_study/controller/create_new_study_controller.dart';
import 'package:get/get.dart';

import '../../../common/custom_dropdown.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../routes/app_pages.dart';
import '../../../utility/responsive.dart';
import '../components/new_study_appbar.dart';

class CreateNewStudyScreen extends StatelessWidget {
  CreateNewStudyScreen({super.key});

  final createNewStudyController = Get.find<CreateNewStudyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        left: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewStudyAppbar(
              studyNameController: TextEditingController(),
              time: '10:49:05 Tue, 30 Apr 24',
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.twenty, left: Dimens.fifteen, right: Dimens.fifteen, bottom: Dimens.six),
                decoration: BoxDecoration(
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.circular(Dimens.sixTeen),
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  width: Get.width / 3.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Obx(
                        () => CustomDropdown(
                          dropDownItemsList: createNewStudyController.programDropDownItemsList,
                          hintText: StringValues.program.tr,
                          onItemSelected: (selectedDropDownItem) {
                            createNewStudyController.selectedProgram.value = selectedDropDownItem;
                          },
                          selectedItem: createNewStudyController.selectedProgram.value,
                        ).marginOnly(bottom: Dimens.eighteen),
                      ),
                      Obx(
                        () => CustomDropdown(
                          dropDownItemsList: createNewStudyController.deptDropDownItemsList,
                          hintText: StringValues.department.tr,
                          onItemSelected: (selectedDropDownItem) {
                            createNewStudyController.selectedDept.value = selectedDropDownItem;
                          },
                          selectedItem: createNewStudyController.selectedDept.value,
                        ).marginOnly(bottom: Dimens.eighteen),
                      ),
                      Obx(
                        () => CustomDropdown(
                          dropDownItemsList: createNewStudyController.positionDropDownItemsList,
                          hintText: StringValues.position.tr,
                          onItemSelected: (selectedDropDownItem) {
                            createNewStudyController.selectedPosition.value = selectedDropDownItem;
                          },
                          selectedItem: createNewStudyController.selectedPosition.value,
                        ).marginOnly(bottom: Dimens.eighteen),
                      ),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              color: ColorValues.whiteColor,
              child: CustomPrimaryButton(
                buttonWidth: GetResponsiveDimens.widthDivFourAndTwoHundredForty(context),
                btnText: StringValues.create.tr,
                margin: EdgeInsets.symmetric(vertical: GetResponsiveDimens.tenAndEight(context), horizontal: GetResponsiveDimens.twentyAndFourteen(context)),
                borderRadius: BorderRadius.circular(GetResponsiveDimens.nineAndEight(context)),
                contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.twentyFiveAndTwentyOne(context)),
                buttonColor: ColorValues.primaryGreenColor,
                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                onTap: () {
                  Get.toNamed(AppRoutes.study);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}