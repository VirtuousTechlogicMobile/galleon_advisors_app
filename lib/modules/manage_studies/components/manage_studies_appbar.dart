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
import '../controller/manage_studies_controller.dart';

class ManageStudiesAppbar extends StatelessWidget {
  ManageStudiesAppbar({super.key});

  final manageStudiesController = Get.find<ManageStudiesController>();

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
            flex: 2,
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
                    StringValues.manageStudies.tr,
                    style: AppStyles.style18Bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Flexible(
                  child: Obx(
                    () => CustomDropdown(
                      dropDownItemsList: manageStudiesController.programDropDownItemsList,
                      hintText: StringValues.position.tr,
                      onItemSelected: (selectedDropDownItem) {
                        manageStudiesController.selectedProgram.value = selectedDropDownItem;
                      },
                      selectedItem: manageStudiesController.selectedProgram.value,
                      border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                      isButtonTxtAlignEnd: true,
                      dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                      buttonPadding: EdgeInsets.only(top: Dimens.five, bottom: Dimens.five, left: Dimens.twelve, right: Dimens.twelve),
                      dropDownIconSize: Size(Dimens.ten, Dimens.ten),
                    ).marginOnly(right: Dimens.thirtyOne, top: Dimens.nine, bottom: Dimens.eleven),
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
                      isButtonTxtAlignEnd: true,
                      dropdownIcon: SvgAssets.dropdownRightArrowSmallIcon,
                      buttonPadding: EdgeInsets.only(top: Dimens.five, bottom: Dimens.five, left: Dimens.twelve, right: Dimens.twelve),
                      dropDownIconSize: Size(Dimens.ten, Dimens.ten),
                    ).marginOnly(right: Dimens.thirtyTwo, top: Dimens.nine, bottom: Dimens.eleven),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
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
                          height: Dimens.fortyThree,
                          width: Dimens.seventyThree,
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
                          height: Dimens.fortyThree,
                          width: Dimens.seventyThree,
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
