import 'dart:math' as math;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/constant/assets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/utility/responsive.dart';

import '../constant/dimens.dart';

class CustomDropdown extends StatefulWidget {
  final List<DropDownMenuItem> dropDownItemsList;
  final String? hintText;
  final DropDownMenuItem? selectedItem;
  final String? dropdownIcon;
  final Size? dropDownIconSize;
  final EdgeInsetsGeometry? buttonPadding;
  final bool isButtonTxtAlignEnd;
  final BoxBorder? border;
  final double? buttonHeight;
  final TextStyle? dropDownMenuItemStyle;
  final TextStyle? dropDowButtonTextStyle;
  final Function(DropDownMenuItem? selectedDropDownItem) onItemSelected;

  const CustomDropdown({
    super.key,
    required this.dropDownItemsList,
    required this.onItemSelected,
    this.hintText,
    this.dropDownIconSize,
    this.dropdownIcon,
    this.selectedItem,
    this.isButtonTxtAlignEnd = false,
    this.buttonPadding,
    this.buttonHeight,
    this.dropDownMenuItemStyle,
    this.dropDowButtonTextStyle,
    this.border,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final GlobalKey buttonKey = GlobalKey();
  double? buttonHeight;
  DropDownMenuItem? selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = widget.selectedItem;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = buttonKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          buttonHeight = renderBox.size.height;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: widget.dropDownItemsList.map<DropdownMenuItem<DropDownMenuItem>>((DropDownMenuItem item) {
          if (widget.dropDownItemsList.first == item) {
            return DropdownMenuItem<DropDownMenuItem>(
              value: item,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      item.itemName,
                      style: widget.dropDownMenuItemStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.textGrayColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Transform.rotate(
                    angle: (math.pi / 2),
                    child: CommonWidgets.fromSvg(
                      svgAsset: widget.dropdownIcon ?? SvgAssets.dropdownRightArrowIcon,
                      height: Responsive.isMobile(context) ? widget.dropDownIconSize?.height ?? Dimens.fourteen : widget.dropDownIconSize?.height ?? Dimens.thirteen,
                      width: Responsive.isMobile(context) ? widget.dropDownIconSize?.width ?? Dimens.fourteen : widget.dropDownIconSize?.width ?? Dimens.thirteen,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return DropdownMenuItem<DropDownMenuItem>(
              value: item,
              child: Text(item.itemName, style: widget.dropDownMenuItemStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.textGrayColor)),
            );
          }
        }).toList(),
        barrierDismissible: true,
        value: selectedItem,
        isDense: true,
        isExpanded: true,
        onChanged: (value) {
          widget.onItemSelected(value);
          selectedItem = value;
        },
        customButton: Container(
          key: buttonKey,
          padding: widget.buttonPadding ?? EdgeInsets.only(top: Dimens.eight, left: Dimens.fifteen, bottom: Dimens.fifteen, right: Dimens.thirteen),
          height: widget.buttonHeight,
          decoration: BoxDecoration(
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(Dimens.seven),
            border: widget.border,
            boxShadow: [BoxShadow(color: ColorValues.blackColor.withOpacity(0.08), blurRadius: 36, spreadRadius: 0, offset: const Offset(0, 0))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: widget.isButtonTxtAlignEnd ? CrossAxisAlignment.center : CrossAxisAlignment.end,
            children: [
              Text(
                widget.selectedItem?.itemName ?? widget.hintText ?? '',
                // style for separate hint text style and selected item text style
                style: widget.selectedItem?.itemName != null
                    ? widget.dropDowButtonTextStyle ?? AppStyles.style16Normal.copyWith(color: ColorValues.textGrayColor)
                    : AppStyles.style16Normal.copyWith(color: ColorValues.textGrayColor),
              ),
              CommonWidgets.fromSvg(
                svgAsset: widget.dropdownIcon ?? SvgAssets.dropdownRightArrowIcon,
                height: widget.dropDownIconSize?.height ?? Dimens.fourteen,
                width: widget.dropDownIconSize?.width ?? Dimens.fifteen,
                boxFit: BoxFit.fill,
              ),
            ],
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: Responsive.isMobile(context) ? Dimens.screenHeight / 2 : Dimens.screenHeight / 3.3,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [BoxShadow(color: ColorValues.blackColor.withOpacity(0.08), blurRadius: 36, spreadRadius: 0, offset: const Offset(0, 0))],
          ),
          elevation: 0,
          offset: Offset(0, buttonHeight ?? Dimens.forty),
        ),
      ),
    );
  }
}

class DropDownMenuItem {
  int itemIndex;
  String itemName;

  DropDownMenuItem({required this.itemIndex, required this.itemName});
}
