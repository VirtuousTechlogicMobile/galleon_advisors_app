import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/styles.dart';
import 'common_widgets.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String btnText;
  final Color? btnTextColor;
  final TextStyle? btnTextStyle;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? contentPadding;
  final Function()? onTap;

  const CustomPrimaryButton({
    super.key,
    required this.btnText,
    this.margin,
    this.buttonWidth,
    this.buttonHeight,
    this.onTap,
    this.buttonColor,
    this.buttonBorderColor,
    this.borderRadius,
    this.contentPadding,
    this.btnTextColor,
    this.btnTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            border: Border.all(color: buttonBorderColor ?? ColorValues.transparent),
            color: buttonColor ?? ColorValues.primaryGreenColor,
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          margin: margin ?? EdgeInsets.zero,
          padding: contentPadding ?? EdgeInsets.symmetric(vertical: Dimens.fifteen),
          child: CommonWidgets.autoSizeText(
            text: btnText,
            textStyle: btnTextStyle ?? AppStyles.style16Normal.copyWith(fontWeight: FontWeight.w500, color: btnTextColor ?? ColorValues.whiteColor),
            minFontSize: 10,
            maxFontSize: 16,
            maxLines: 1,
            textAlign: TextAlign.center,
          )),
    );
  }
}
