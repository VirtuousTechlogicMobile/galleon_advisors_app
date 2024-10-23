import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/styles.dart';
import '../theme/get_theme_wise_color.dart';
import 'common_widgets.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String btnText;
  final Color? btnTextColor;
  final TextStyle? btnTextStyle;
  final int? btnTextMaxLines;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? contentPadding;
  final Function()? onTap;
  final BoxBorder? border;
  final AlignmentGeometry? textAlignment;

  const CustomPrimaryButton({
    super.key,
    required this.btnText,
    this.margin,
    this.buttonWidth,
    this.buttonHeight,
    this.btnTextMaxLines,
    this.onTap,
    this.buttonColor,
    this.borderRadius,
    this.contentPadding,
    this.btnTextColor,
    this.btnTextStyle,
    this.textAlignment,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: buttonColor ?? ColorValues.primaryGreenColor,
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            border: border,
          ),
          alignment: textAlignment ?? Alignment.center,
          margin: margin ?? EdgeInsets.zero,
          padding: contentPadding ?? EdgeInsets.symmetric(vertical: Dimens.fifteen),
          child: Text(
            btnText,
            style: btnTextStyle ?? GetThemeStyles.getStyle16Normal(context)?.copyWith(fontWeight: FontWeight.w500, color: btnTextColor ?? ColorValues.whiteColor),
            maxLines: btnTextMaxLines ?? 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
