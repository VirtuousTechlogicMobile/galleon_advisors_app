import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/delete_studies.dart';
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
      body: Column(
        children: [
          Container(
            color: ColorValues.whiteColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                    color: ColorValues.blackColor,
                  ),
                ),
                Text(
                  StringValues.manageStudies.tr,
                  style: AppStyles.style24Bold,
                ),
                Obx(() {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.ten,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                      border: Border.all(
                        color: ColorValues.blackColor,
                      ),
                    ),
                    child: DropdownButton<String>(
                      icon: Icon(
                        Icons.arrow_right_outlined,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.fifteen,
                      ),
                      underline: SizedBox(),
                      value: manageStudiesController.selectedValue.value.isEmpty ? null : manageStudiesController.selectedValue.value,
                      hint: Text('Program'),
                      items: manageStudiesController.items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          manageStudiesController.updateValue(value); // Change selected value
                        }
                      },
                    ),
                  );
                }),
                Obx(() {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.ten,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                      border: Border.all(
                        color: ColorValues.blackColor,
                      ),
                    ),
                    child: DropdownButton<String>(
                      icon: Icon(
                        Icons.arrow_right_outlined,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.fifteen,
                      ),
                      underline: SizedBox(),
                      value: manageStudiesController.selectedValue.value.isEmpty ? null : manageStudiesController.selectedValue.value,
                      hint: Text('Deparment'),
                      items: manageStudiesController.items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          manageStudiesController.updateValue(value); // Change selected value
                        }
                      },
                    ),
                  );
                }),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return DeleteStudies();
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.eighteen,
                          vertical: Dimens.eight,
                        ),
                        decoration: BoxDecoration(color: ColorValues.lightBgColor, borderRadius: BorderRadius.circular(Dimens.eight)),
                        child: Container(
                          padding: EdgeInsets.all(
                            Dimens.ten,
                          ),
                          decoration: BoxDecoration(
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(
                              Dimens.hundred,
                            ),
                          ),
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            color: ColorValues.errorColor,
                          ),
                        ),
                      ),
                    ),
                    Dimens.boxWidth20,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimens.eighteen,
                        vertical: Dimens.eight,
                      ),
                      decoration: BoxDecoration(color: ColorValues.lightBgColor, borderRadius: BorderRadius.circular(Dimens.eight)),
                      child: Container(
                        padding: EdgeInsets.all(
                          Dimens.ten,
                        ),
                        decoration: BoxDecoration(
                          color: ColorValues.whiteColor,
                          borderRadius: BorderRadius.circular(
                            Dimens.hundred,
                          ),
                        ),
                        child: const Icon(
                          Icons.file_upload_outlined,
                          color: ColorValues.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ExpandableView(),
        ],
      ),

      //ExpandableView(),
    );
  }
}
