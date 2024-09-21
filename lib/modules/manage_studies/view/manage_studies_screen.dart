import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/dimens.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/modules/manage_studies/controller/manage_studies_controller.dart';
import 'package:get/get.dart';

import 'expandable_view.dart';

class ManageStudiesScreen extends StatelessWidget {
  ManageStudiesScreen({super.key});

  final ManageStudiesController manageStudiesController = Get.find<ManageStudiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorValues.whiteColor,
        title: Text(
          StringValues.manageStudies.tr,
          style: AppStyles.style24Bold,
        ),
        leading: Padding(
          padding: EdgeInsets.all(Dimens.fifteen),
          child: Container(
            // color: ColorValues.blackColor,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorValues.blackColor,
              ),
              borderRadius: BorderRadius.circular(
                Dimens.hundred,
              ),
            ),
            child: const Icon(
              Icons.keyboard_arrow_left,
            ),
          ),
        ),
        actions: [],
      ),
      body: ExpandableView(),
    );
  }
}
