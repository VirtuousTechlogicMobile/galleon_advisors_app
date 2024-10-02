import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/custom_dropdown.dart';
import 'package:galleon_advisors_app/modules/manage_positions/controller/manage_positions_controller.dart';
import 'package:galleon_advisors_app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../common/custom_textfield.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';

class ManagePositionsAppbar extends StatelessWidget {
  ManagePositionsAppbar({super.key});

  final managePositionsController = Get.find<ManagePositionsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.fifty,
      padding: EdgeInsets.only(right: Dimens.sevenTeen),
      alignment: Alignment.centerLeft,
      color: ColorValues.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CommonWidgets.fromSvg(svgAsset: SvgAssets.backIconOutlined),
                  ).marginOnly(left: Dimens.twentyFour, right: Dimens.twentyNine),
                ),
                Flexible(
                  child: Text(
                    StringValues.managePosition.tr,
                    style: AppStyles.style18Bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Obx(
              () => CustomDropdown(
                dropDownItemsList: managePositionsController.deptDropDownItemsList,
                hintText: StringValues.department.tr,
                onItemSelected: (selectedDropDownItem) {
                  managePositionsController.selectedDept.value = selectedDropDownItem;
                },
                selectedItem: managePositionsController.selectedDept.value,
                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                isButtonTxtAlignEnd: true,
                dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                buttonPadding: EdgeInsets.only(top: Dimens.five, bottom: Dimens.five, left: Dimens.twelve, right: Dimens.twelve),
                dropDownIconSize: Size(Dimens.ten, Dimens.ten),
              ).marginOnly(right: Dimens.fiftyTwo, top: Dimens.ten, bottom: Dimens.ten),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: CustomTextField(
                      controller: TextEditingController(),
                      fillColor: ColorValues.textFieldLightGrayColor.withOpacity(0.50),
                      hintText: StringValues.searchPositionName.tr,
                      borderRadius: BorderRadius.circular(Dimens.eight),
                      borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
                      contentPadding: EdgeInsets.symmetric(vertical: Dimens.six, horizontal: Dimens.nineteen),
                      textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.50)),
                      cursorColor: ColorValues.blackColor,
                      maxLines: 1,
                    ).marginOnly(top: Dimens.ten, bottom: Dimens.ten),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.createNewPosition);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: Dimens.twentyNine),
                      height: Dimens.fortyThree,
                      width: Dimens.seventyThree,
                      decoration: BoxDecoration(color: ColorValues.softGrayColor, borderRadius: BorderRadius.circular(Dimens.eight)),
                      alignment: Alignment.center,
                      child: Container(
                        height: Dimens.thirty,
                        width: Dimens.thirty,
                        decoration: BoxDecoration(
                          color: ColorValues.whiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: ColorValues.blackColor.withOpacity(0.12),
                              offset: const Offset(0, 0),
                              blurRadius: 16,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        child: CommonWidgets.fromSvg(
                          svgAsset: SvgAssets.addIcon,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
