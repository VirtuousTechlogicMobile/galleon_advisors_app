import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/custom_dropdown.dart';
import 'package:galleon_advisors_app/modules/manage_studies/components/manage_studies_dialogs.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';
import '../../../utility/responsive.dart';
import '../controller/manage_studies_controller.dart';

class ManageStudiesAppbar extends StatelessWidget {
  ManageStudiesAppbar({super.key});

  final manageStudiesController = Get.find<ManageStudiesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: Dimens.sevenTeen,
        top: GetResponsiveDimens.sevenAndNine(context),
        bottom: GetResponsiveDimens.fiveAndSeven(context),
      ),
      alignment: Alignment.centerLeft,
      color: ColorValues.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: GetResponsiveFlex.threeAndTwo(context),
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
                  ).marginOnly(left: Dimens.twentyFour, right: Dimens.twentyFour),
                ),
                Text(
                  StringValues.manageStudies.tr,
                  style: AppStyles.style16Bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            flex: GetResponsiveFlex.fourAndThree(context),
            child: Row(
              children: [
                Flexible(
                  child: Obx(
                    () => CustomDropdown(
                      dropDownItemsList: manageStudiesController.programDropDownItemsList,
                      hintText: StringValues.program.tr,
                      onItemSelected: (selectedDropDownItem) {
                        manageStudiesController.selectedProgram.value = selectedDropDownItem;
                      },
                      selectedItem: manageStudiesController.selectedProgram.value,
                      border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                      dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                      buttonPadding: EdgeInsets.only(top: Dimens.five, bottom: Dimens.five, left: Dimens.twelve, right: Dimens.twelve),
                      dropDownIconSize: Size(Dimens.ten, Dimens.ten),
                    ).marginOnly(right: Dimens.thirtyOne),
                  ),
                ),
                Flexible(
                  child: Obx(
                    () => CustomDropdown(
                      dropDownItemsList: manageStudiesController.deptDropDownItemsList,
                      hintText: StringValues.department.tr,
                      onItemSelected: (selectedDropDownItem) {
                        manageStudiesController.selectedDept.value = selectedDropDownItem;
                      },
                      selectedItem: manageStudiesController.selectedDept.value,
                      border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                      dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                      buttonPadding: EdgeInsets.only(top: Dimens.five, bottom: Dimens.five, left: Dimens.twelve, right: Dimens.twelve),
                      dropDownIconSize: Size(Dimens.ten, Dimens.ten),
                    ).marginOnly(right: Dimens.thirtyTwo),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: GetResponsiveFlex.twoAndOne(context),
            child: Align(
              alignment: Alignment.centerRight,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (manageStudiesController.expandedListTileIndex.value != null)
                      InkWell(
                        onTap: () {
                          manageStudiesController.isDialogOpen.value = true;
                          ManageStudiesDialogs.deleteStudiesDialog(
                            context: context,
                            whenComplete: () {
                              manageStudiesController.isDialogOpen.value = false;
                            },
                            onTapDeleteButton: () {
                              Get.back();
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: Dimens.ten),
                          padding: EdgeInsets.symmetric(horizontal: Dimens.twenty, vertical: Dimens.seven),
                          decoration: BoxDecoration(color: ColorValues.softGrayColor, borderRadius: BorderRadius.circular(Dimens.eight)),
                          alignment: Alignment.center,
                          child: Container(
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
                            child: CommonWidgets.fromSvg(
                              svgAsset: SvgAssets.deleteRoundedIcon,
                            ),
                          ),
                        ),
                      ),
                    if (manageStudiesController.expandedListTileIndex.value != null)
                      InkWell(
                        onTap: () {
                          manageStudiesController.isDialogOpen.value = true;
                          // TODO: add dynamic study name here
                          ManageStudiesDialogs.uploadStudyDialog(
                            context: context,
                            studyName: 'Test',
                            positionName: 'LowCode',
                            onTapUploadButton: () {
                              Get.back();
                            },
                            whenComplete: () {
                              manageStudiesController.isDialogOpen.value = false;
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: Dimens.ten),
                          padding: EdgeInsets.only(left: Dimens.twenty, right: Dimens.twenty, top: Dimens.seven, bottom: Dimens.eight),
                          decoration: BoxDecoration(color: ColorValues.softGrayColor, borderRadius: BorderRadius.circular(Dimens.eight)),
                          alignment: Alignment.center,
                          child: Container(
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
                            child: CommonWidgets.fromSvg(
                              svgAsset: SvgAssets.uploadRoundedIcon,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
