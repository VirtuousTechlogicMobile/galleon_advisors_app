import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_dropdown.dart';
import 'package:galleon_user/modules/manage_studies/components/manage_studies_dialogs.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';
import '../../../theme/get_theme_wise_color.dart';
import '../../../utility/responsive.dart';
import '../../../utility/role_permission.dart';
import '../controller/manage_studies_controller.dart';

class ManageStudiesAppbar extends StatelessWidget {
  ManageStudiesAppbar({super.key});

  final manageStudiesController = Get.find<ManageStudiesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetResponsiveDimens.getAppBarHeight(context),
      padding: EdgeInsets.only(
        right: Dimens.fifteen,
        top: Dimens.seven,
        bottom: Dimens.four,
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
                  style: GetThemeStyles.getStyle16Normal(context),
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
                    ).marginOnly(right: Dimens.fifteen),
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
                    ).marginOnly(left: Dimens.fifteen),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: GetResponsiveFlex.twoAndOne(context),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (manageStudiesController.expandedListTileIndex.value != null && hasAccessFeature(Features.deleteStudies))
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
                        margin: EdgeInsets.only(right: Dimens.seven),
                        padding: EdgeInsets.symmetric(horizontal: Dimens.twenty),
                        decoration: BoxDecoration(color: ColorValues.softGrayColor, borderRadius: BorderRadius.circular(Dimens.seven)),
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
                          child: CommonWidgets.fromSvg(svgAsset: SvgAssets.deleteIcon, margin: EdgeInsets.symmetric(horizontal: Dimens.seven, vertical: Dimens.seven)),
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
                        margin: EdgeInsets.only(left: Dimens.seven),
                        padding: EdgeInsets.symmetric(horizontal: Dimens.twenty),
                        decoration: BoxDecoration(color: ColorValues.softGrayColor, borderRadius: BorderRadius.circular(Dimens.seven)),
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
                              ),
                            ],
                          ),
                          child: CommonWidgets.fromSvg(svgAsset: SvgAssets.uploadIcon, margin: EdgeInsets.symmetric(horizontal: Dimens.seven, vertical: Dimens.seven)),
                        ),
                      ),
                    ),
                ],
              ).marginOnly(left: Dimens.twenty),
            ),
          ),
        ],
      ),
    );
  }
}
