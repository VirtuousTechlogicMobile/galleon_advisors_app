import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/dimens.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/modules/manage_studies/controller/manage_studies_controller.dart';
import 'package:get/get.dart';

import '../../../constant/assets.dart';
import '../components/custom_expansion_tile_widget.dart';

class ManageStudiesScreen extends StatelessWidget {
  ManageStudiesScreen({super.key});

  final manageStudiesController = Get.find<ManageStudiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Dimens.fifty,
              alignment: Alignment.centerLeft,
              color: ColorValues.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CommonWidgets.fromSvg(svgAsset: SvgAssets.backIconOutlined),
                  ).marginOnly(left: Dimens.twentyFour, right: Dimens.twentyNine),
                  Text(
                    StringValues.manageStudies.tr,
                    style: AppStyles.style18Bold,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        print("mansi : ${manageStudiesController.expandedListTileIndex.value}");
                        return Obx(
                          () => CustomExpansionTileWidget(
                            isExpanded: manageStudiesController.expandedListTileIndex.value == index,
                            onTap: () {
                              if (manageStudiesController.expandedListTileIndex.value == index) {
                                manageStudiesController.expandedListTileIndex.value = null; // Collapse if tapped again
                              } else {
                                manageStudiesController.expandedListTileIndex.value = index; // Expand the tapped one
                              }
                            },
                            children: [
                              CheckboxListTile(
                                title: Text("Select All"),
                                value: true,
                                onChanged: (bool? value) {},
                              ),
                              CheckboxListTile(
                                title: Text("Study Name"),
                                value: false,
                                onChanged: (bool? value) {},
                                controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
                              ),
                              CheckboxListTile(
                                title: Text("Test"),
                                value: false,
                                onChanged: (bool? value) {},
                                controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
                              ),
                            ],
                          ).marginOnly(bottom: Dimens.eleven),
                        );
                      },
                    ),
                  ),
                ],
              ).paddingOnly(left: Dimens.twentyFour, top: Dimens.twentyFour, bottom: Dimens.thirty, right: Dimens.twentyFour),
            ),
          ],
        ),
      ),
    );
  }
}
