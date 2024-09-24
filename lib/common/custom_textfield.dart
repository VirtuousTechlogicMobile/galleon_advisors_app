import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galleon_advisors_app/constant/colors.dart';

import '../constant/dimens.dart';
import '../constant/styles.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final TextInputType? inputType;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final bool isReadOnly;
  final TextStyle? textStyle;
  final Function(String value)? onChange;
  final Widget? prefixIcon;
  final int? length;
  final int? maxLines;
  final bool? autofocus;
  final bool isShowError;
  final String errMsg;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTap;
  final bool? obscureText;
  final TextAlign? textAlign;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final String? obscuringCharacter;
  final List<TextInputFormatter>? inputFormatters;
  final Color? cursorColor;

  const CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.focusNode,
    this.hintStyle,
    this.inputType,
    this.isReadOnly = false,
    this.length,
    this.textStyle,
    this.maxLines,
    this.onChange,
    this.prefixIcon,
    this.contentPadding,
    this.autofocus,
    this.isShowError = false,
    this.errMsg = '',
    this.fillColor,
    this.suffixIcon,
    this.onTap,
    this.obscureText,
    this.onTapOutside,
    this.textAlign,
    this.borderRadius,
    this.borderSide,
    this.inputFormatters,
    this.obscuringCharacter,
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: ColorValues.blackColor.withOpacity(0.08), blurRadius: 36, spreadRadius: 0, offset: const Offset(0, 0))],
      ),
      child: TextFormField(
        keyboardType: inputType ?? TextInputType.text,
        expands: false,
        controller: controller,
        inputFormatters: inputFormatters,
        readOnly: isReadOnly,
        autofocus: autofocus ?? false,
        // style: textStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.primaryGreenColor),
        style: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.focused)) {
            return textStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.primaryGreenColor);
          }
          return AppStyles.style16Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.50));
        }),
        maxLength: length,
        maxLines: maxLines,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '•',
        showCursor: !isReadOnly,
        cursorWidth: Dimens.one,
        cursorColor: cursorColor ?? ColorValues.primaryGreenColor,
        onTapOutside: onTapOutside,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: Dimens.nineteen, horizontal: Dimens.twenty),
          isDense: true,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: Dimens.ten),
            child: suffixIcon,
          ),
          prefixIcon: prefixIcon,
          suffixIconConstraints: BoxConstraints(maxWidth: Dimens.thirty, maxHeight: Dimens.thirty, minWidth: Dimens.fifteen, minHeight: Dimens.fifteen),
          filled: true,
          fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.focused)) {
              return fillColor ?? ColorValues.transparent;
            }
            return fillColor ?? ColorValues.whiteColor;
          }),
          hintText: hintText ?? '',
          hintStyle: hintStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.blackColor.withOpacity(0.50)),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(Dimens.seven),
            borderSide: borderSide ?? const BorderSide(color: ColorValues.primaryGreenColor, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(Dimens.seven),
            borderSide: borderSide ?? BorderSide.none /*const BorderSide(color: ColorValues.primaryColorGreen, width: 1.5)*/,
          ),
        ),
        focusNode: focusNode,
        onTap: onTap,
        onChanged: (value) => (onChange != null) ? onChange!(value) : null,
      ),
    );
  }
}
