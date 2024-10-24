import 'dart:math' as math;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:galleon_user/common/common_widgets.dart';
import 'package:galleon_user/constant/assets.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';

import '../constant/dimens.dart';
import '../theme/get_theme_wise_color.dart';

class CustomDropdown extends StatefulWidget {
  final List<DropDownMenuItem> dropDownItemsList;
  final String? hintText;
  final DropDownMenuItem? selectedItem;
  final String? dropdownIcon;
  final Size? dropDownIconSize;
  final EdgeInsetsGeometry? buttonPadding;
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
  RxDouble buttonHeight = Dimens.forty.obs;
  // DropDownMenuItem? selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = buttonKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        buttonHeight.value = renderBox.size.height;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(
        () => DropdownButton2(
          items: widget.dropDownItemsList.map<DropdownMenuItem<DropDownMenuItem>>((DropDownMenuItem? item) {
            if (widget.dropDownItemsList.first == item) {
              return DropdownMenuItem<DropDownMenuItem>(
                value: item,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (item != null)
                      Flexible(
                        child: Text(
                          item.itemName,
                          style: widget.dropDownMenuItemStyle ?? GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.textGrayColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    Transform.rotate(
                      angle: (math.pi / 2),
                      child: CommonWidgets.fromSvg(
                        svgAsset: widget.dropdownIcon ?? SvgAssets.dropdownRightArrowIcon,
                        height: widget.dropDownIconSize?.height ?? GetResponsiveDimens.fourteenAndThirteen(context),
                        width: widget.dropDownIconSize?.width ?? GetResponsiveDimens.fourteenAndThirteen(context),
                        boxFit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return DropdownMenuItem<DropDownMenuItem>(
                value: item,
                child: Text(item?.itemName ?? '', style: widget.dropDownMenuItemStyle ?? GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.textGrayColor)),
              );
            }
          }).toList(),
          barrierDismissible: true,
          value: widget.selectedItem,
          isDense: true,
          isExpanded: true,
          onChanged: (value) {
            widget.onItemSelected(value);
          },
          customButton: Container(
            key: buttonKey,
            padding: widget.buttonPadding ?? EdgeInsets.only(top: Dimens.ten, left: Dimens.fifteen, bottom: Dimens.fourteen, right: Dimens.thirteen),
            height: widget.buttonHeight,
            decoration: BoxDecoration(
              color: ColorValues.whiteColor,
              borderRadius: BorderRadius.circular(Dimens.seven),
              border: widget.border,
              boxShadow: [BoxShadow(color: ColorValues.blackColor.withOpacity(0.08), blurRadius: 36, spreadRadius: 0, offset: const Offset(0, 0))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.selectedItem?.itemName ?? widget.hintText ?? '',
                  // style for separate hint text style and selected item text style
                  style: widget.selectedItem?.itemName != null
                      ? widget.dropDowButtonTextStyle ?? GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.textGrayColor)
                      : GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.textGrayColor),
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
            maxHeight: GetResponsiveDimens.heightDivTwoAndThreePointThree(context),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [BoxShadow(color: ColorValues.blackColor.withOpacity(0.08), blurRadius: 36, spreadRadius: 0, offset: const Offset(0, 0))],
            ),
            elevation: 0,
            offset: Offset(0, buttonHeight.value),
          ),
        ),
      ),
    );
  }
}

class DropDownMenuItem {
  String? itemId;
  String itemName;
  dynamic itemData;

  DropDownMenuItem({this.itemId, required this.itemName, this.itemData});
}
