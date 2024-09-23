import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/modules/manage_studies/controller/manage_studies_controller.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/strings.dart';
import '../../../constant/styles.dart';

class ExpandableView extends StatelessWidget {
  ExpandableView({super.key});

  final ManageStudiesController manageStudiesController = Get.find<ManageStudiesController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        collapsedBackgroundColor: ColorValues.whiteColor,
        backgroundColor: ColorValues.whiteColor,
        collapsedShape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimens.ten,
          ),
        ),

        title: Row(
          children: [
            Text(
              "Food & Beverage - Barista",
              style: TextStyle(fontSize: Dimens.sixTeen, fontWeight: FontWeight.w600),
            ),
            Dimens.boxHeight12,
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: Dimens.five,
            )
          ],
        ),
        trailing: const Icon(Icons.keyboard_arrow_down),

        // This applies the shape and border radius directly to ExpansionTile
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.twelve), // Rounded corners
          side: const BorderSide(color: ColorValues.lightBgColor), // Border color
        ),

        children: [
          Obx(() {
            return CheckboxListTile(
              title: Text(
                StringValues.selectAll.tr,
                style: AppStyles.style18Bold.copyWith(
                  color: ColorValues.blackColor,
                  fontSize: Dimens.eighteen,
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: manageStudiesController.isChecked.value.isNull ? null : manageStudiesController.isChecked.value,
              onChanged: (bool? value) {
                //setState(() {
                manageStudiesController.isChecked.value = value!;
                manageStudiesController.isChecked.value = value;
                //});
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
          CheckboxListTile(
            title: Text(
              "Study Name",
            ),
            secondary: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonWidgets.fromSvg(
                  svgAsset: SvgAssets.pauseIcon,
                ),
                Dimens.boxWidth16,
                CustomPrimaryButton(
                  buttonWidth: Dimens.oneHundredFifty,
                  btnText: "View",
                  onTap: () {},
                ),
              ],
            ),
            value: manageStudiesController.isChecked.value,
            onChanged: (bool? value) {
              manageStudiesController.isChecked.value = value!;
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Dimens.boxHeight12,
        ],
      ),
    );
  }
}
