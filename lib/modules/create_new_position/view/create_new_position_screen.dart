import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/modules/create_new_position/components/create_new_position_appbar.dart';
import 'package:galleon_advisors_app/modules/create_new_position/controller/create_new_position_controller.dart';
import 'package:galleon_advisors_app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../common/custom_dropdown.dart';
import '../../../common/custom_textfield.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';

class CreateNewPositionScreen extends StatelessWidget {
  CreateNewPositionScreen({super.key});

  final createNewPositionController = Get.find<CreateNewPositionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CreateNewPositionAppbar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.twenty, left: Dimens.fifteen, right: Dimens.fifteen, bottom: Dimens.six),
                padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.fifteen),
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
                      Flexible(
                        child: Obx(
                          () => CustomDropdown(
                            dropDownItemsList: createNewPositionController.deptDropDownItemsList,
                            hintText: StringValues.department.tr,
                            onItemSelected: (selectedDropDownItem) {
                              createNewPositionController.selectedDept.value = selectedDropDownItem;
                            },
                            dropDowButtonTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                            buttonHeight: Dimens.thirtyFive,
                            selectedItem: createNewPositionController.selectedDept.value,
                            border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                            isButtonTxtAlignEnd: true,
                            dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                            buttonPadding: EdgeInsets.only(left: Dimens.sixTeen, right: Dimens.twelve),
                            dropDownIconSize: Size(Dimens.ten, Dimens.ten),
                          ).marginOnly(bottom: Dimens.fourteen),
                        ),
                      ),
                      Flexible(
                        child: CustomTextField(
                          controller: createNewPositionController.positionController,
                          fillColor: ColorValues.softWhiteColor,
                          textFieldHeight: Dimens.thirtyFive,
                          hintText: StringValues.typeName.tr,
                          borderRadius: BorderRadius.circular(Dimens.eight),
                          textAlign: TextAlign.left,
                          borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
                          contentPadding: EdgeInsets.only(top: Dimens.seven, bottom: Dimens.nine, left: Dimens.sixTeen, right: Dimens.twelve),
                          textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                          cursorColor: ColorValues.blackColor,
                          maxLines: 1,
                        ).marginOnly(bottom: Dimens.fiftyFive),
                      ),
                      Flexible(
                        child: Obx(
                          () => CustomDropdown(
                            dropDownItemsList: createNewPositionController.templateDropDownItemsList,
                            hintText: StringValues.template.tr,
                            onItemSelected: (selectedDropDownItem) {
                              createNewPositionController.selectedTemp.value = selectedDropDownItem;
                            },
                            buttonHeight: Dimens.thirtyFive,
                            dropDowButtonTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                            selectedItem: createNewPositionController.selectedTemp.value,
                            border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                            isButtonTxtAlignEnd: true,
                            dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                            buttonPadding: EdgeInsets.only(left: Dimens.sixTeen, right: Dimens.twelve),
                            dropDownIconSize: Size(Dimens.ten, Dimens.ten),
                          ).marginOnly(bottom: Dimens.eight),
                        ),
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
                  buttonHeight: Dimens.fiftySix,
                  buttonWidth: Dimens.twoHundredEighteen,
                  btnText: StringValues.next.tr,
                  btnTextColor: createNewPositionController.selectedDept.value != null && createNewPositionController.positionText.isNotEmpty
                      ? ColorValues.whiteColor
                      : ColorValues.blackColor,
                  margin: EdgeInsets.symmetric(vertical: Dimens.eight, horizontal: Dimens.fourteen),
                  borderRadius: BorderRadius.circular(Dimens.eight),
                  buttonColor: createNewPositionController.selectedDept.value != null && createNewPositionController.positionText.isNotEmpty
                      ? ColorValues.primaryGreenColor
                      : ColorValues.softGrayColor,
                  border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                  onTap: () {
                    if (createNewPositionController.positionText.isNotEmpty && createNewPositionController.selectedDept.value != null) {
                      Get.toNamed(AppRoutes.createPositionAddServiceAndOpp);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
