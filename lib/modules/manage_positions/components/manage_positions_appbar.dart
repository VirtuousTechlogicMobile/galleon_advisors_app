import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_dropdown.dart';
import 'package:galleon_user/modules/manage_positions/controller/manage_positions_controller.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../common/custom_textfield.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';
import '../../../utility/responsive.dart';
import '../../../utility/role_permission.dart';

class ManagePositionsAppbar extends StatelessWidget {
  ManagePositionsAppbar({super.key});

  final managePositionsController = Get.find<ManagePositionsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: Dimens.twenty,
        top: GetResponsiveDimens.fiveAndNine(context),
        bottom: GetResponsiveDimens.fourAndSeven(context),
      ),
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
                  ).marginOnly(left: Dimens.twentyFour, right: Dimens.thirty),
                ),
                Text(
                  StringValues.managePosition.tr,
                  style: AppStyles.style16Bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // const Spacer(),
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
                dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                buttonPadding: EdgeInsets.only(top: Dimens.five, bottom: Dimens.five, left: Dimens.twelve, right: Dimens.twelve),
                dropDownIconSize: Size(Dimens.ten, Dimens.ten),
              ).marginOnly(right: Dimens.forty),
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
                      borderRadius: BorderRadius.circular(Dimens.seven),
                      borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
                      contentPadding: EdgeInsets.only(top: Dimens.seven, bottom: Dimens.seven, right: Dimens.nineteen, left: Dimens.twentyEight),
                      textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.50)),
                      cursorColor: ColorValues.blackColor,
                      maxLines: 1,
                    ),
                  ),
                  Visibility(
                    visible: hasAccessFeature(Features.addPositions),
                    replacement: SizedBox(
                      width: Dimens.fifteen,
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.createNewPosition);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: Dimens.twentyFive),
                        padding: EdgeInsets.symmetric(vertical: Dimens.ten, horizontal: Dimens.twentyFour),
                        decoration: BoxDecoration(color: ColorValues.softGrayColor, borderRadius: BorderRadius.circular(Dimens.ten)),
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: Dimens.eight, horizontal: Dimens.nine),
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