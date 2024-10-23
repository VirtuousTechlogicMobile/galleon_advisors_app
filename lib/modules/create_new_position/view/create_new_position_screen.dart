import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/modules/create_new_position/components/create_new_position_appbar.dart';
import 'package:galleon_user/modules/create_new_position/controller/create_new_position_controller.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';
import '../../../common/custom_dropdown.dart';
import '../../../common/custom_textfield.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../../../theme/get_theme_wise_color.dart';

class CreateNewPositionScreen extends StatelessWidget {
  CreateNewPositionScreen({super.key});

  final createNewPositionController = Get.find<CreateNewPositionController>();

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
            const CreateNewPositionAppbar(),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Container(
                  margin: EdgeInsets.only(top: Dimens.twenty, left: Dimens.fifteen, right: Dimens.fifteen, bottom: Dimens.six),
                  padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.fifteen),
                  decoration: BoxDecoration(
                    color: ColorValues.whiteColor,
                    borderRadius: BorderRadius.circular(Dimens.sixTeen),
                  ),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: GetResponsiveDimens.widthDivTwoPointFiveAndThreePointThree(context),
                              child: Obx(
                                () => CustomDropdown(
                                  dropDownItemsList: createNewPositionController.deptDropDownItemsList,
                                  hintText: StringValues.department.tr,
                                  onItemSelected: (selectedDropDownItem) {
                                    createNewPositionController.selectedDept.value = selectedDropDownItem;
                                  },
                                  dropDowButtonTextStyle: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
                                  buttonHeight: GetResponsiveDimens.eightyAndThirtyFive(context),
                                  selectedItem: createNewPositionController.selectedDept.value,
                                  border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                                  dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                                  buttonPadding: EdgeInsets.only(left: Dimens.sixTeen, right: Dimens.twelve),
                                  dropDownIconSize: Size(Dimens.ten, Dimens.ten),
                                ).marginOnly(bottom: Dimens.ten),
                              ),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: GetResponsiveDimens.widthDivTwoPointFiveAndThreePointThree(context),
                              child: CustomTextField(
                                controller: createNewPositionController.positionController,
                                fillColor: ColorValues.softWhiteColor,
                                hintText: StringValues.typeName.tr,
                                borderRadius: BorderRadius.circular(Dimens.seven),
                                textAlign: TextAlign.left,
                                borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
                                contentPadding: EdgeInsets.only(top: Dimens.eleven, bottom: Dimens.twelve, left: Dimens.sixTeen, right: Dimens.twelve),
                                textStyle: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
                                cursorColor: ColorValues.blackColor,
                                maxLines: 1,
                              ).marginOnly(bottom: Dimens.fiftyFive),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: GetResponsiveDimens.widthDivTwoPointFiveAndThreePointThree(context),
                              child: Obx(
                                () => CustomDropdown(
                                  dropDownItemsList: createNewPositionController.templateDropDownItemsList,
                                  hintText: StringValues.template.tr,
                                  onItemSelected: (selectedDropDownItem) {
                                    createNewPositionController.selectedTemp.value = selectedDropDownItem;
                                  },
                                  buttonHeight: GetResponsiveDimens.eightyAndThirtyFive(context),
                                  dropDowButtonTextStyle: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
                                  selectedItem: createNewPositionController.selectedTemp.value,
                                  border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                                  dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                                  buttonPadding: EdgeInsets.only(left: Dimens.sixTeen, right: Dimens.twelve),
                                  dropDownIconSize: Size(Dimens.ten, Dimens.ten),
                                ).marginOnly(bottom: Dimens.eight),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            // bottom bar
            Container(
              height: GetResponsiveDimens.getBottomBarButtonHeight(context),
              alignment: Alignment.centerRight,
              color: ColorValues.whiteColor,
              child: Obx(
                () => CustomPrimaryButton(
                  buttonWidth: GetResponsiveDimens.widthDivFourAndTwoHundredForty(context),
                  btnText: StringValues.next.tr,
                  btnTextColor: createNewPositionController.selectedDept.value != null && createNewPositionController.positionText.isNotEmpty
                      ? ColorValues.whiteColor
                      : ColorValues.blackColor,
                  margin: EdgeInsets.symmetric(vertical: GetResponsiveDimens.tenAndEight(context), horizontal: GetResponsiveDimens.twentyAndFourteen(context)),
                  borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                  contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.twentyFiveAndTwentyOne(context)),
                  buttonColor: createNewPositionController.selectedDept.value != null && createNewPositionController.positionText.isNotEmpty
                      ? ColorValues.primaryGreenColor
                      : ColorValues.softGrayColor,
                  border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                  onTap: () {
                    if (createNewPositionController.selectedDept.value == null) {
                      AppUtility.showSnackBar(StringValues.pleaseSelectDepartment.tr);
                    } else if (createNewPositionController.positionController.text.isEmpty) {
                      AppUtility.showSnackBar(StringValues.pleaseEnterName.tr);
                    } else {
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
