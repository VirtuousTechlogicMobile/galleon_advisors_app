import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/textfield_with_label.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:get/get.dart';

import '../constant/dimens.dart';
import '../utility/responsive.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final bool isShowCheckBox;
  final Widget child;
  final double? checkBoxHeight;
  final double? checkBoxWidth;
  final double paddingBetween;
  final Function(bool value) onValueChange;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.child,
    required this.paddingBetween,
    this.checkBoxHeight,
    this.checkBoxWidth,
    this.isShowCheckBox = true,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // check button
        isShowCheckBox
            ? InkWell(
                onTap: () {
                  onValueChange(!isChecked);
                },
                child: Container(
                  margin: EdgeInsets.only(right: paddingBetween),
                  width: checkBoxWidth ?? GetResponsiveDimens.fiftyEightAndTwentySix(context),
                  height: checkBoxHeight ?? GetResponsiveDimens.fiftyFiveAndTwentyFour(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(GetResponsiveDimens.sevenAndFive(context)),
                    color: ColorValues.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorValues.blackColor.withOpacity(0.12),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: isChecked
                      ? Container(
                          margin: EdgeInsets.all(GetResponsiveDimens.sixAndThree(context)),
                          decoration: BoxDecoration(color: ColorValues.blackColor.withOpacity(0.50), borderRadius: BorderRadius.circular(GetResponsiveDimens.nineAndFive(context))),
                        )
                      : null,
                ),
              )
            : SizedBox(
                width: GetResponsiveDimens.fiftyEightAndTwentySix(context),
                height: GetResponsiveDimens.fiftyFiveAndTwentyFour(context),
              ).marginOnly(right: paddingBetween),
        child,
      ],
    );
  }
}
