import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/dimens.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/modules/manage_studies/controller/manage_studies_controller.dart';
import 'package:get/get.dart';

import '../../../constant/assets.dart';
import 'expandable_view.dart';

class ManageStudiesScreen extends StatelessWidget {
  ManageStudiesScreen({super.key});

  final ManageStudiesController manageStudiesController = Get.find<ManageStudiesController>();

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
            Flexible(
              child: ExpandableView(),
            ),
          ],
        ),
      ),
    );
  }
}
