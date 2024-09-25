import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/common_widgets.dart';
import 'package:galleon_advisors_app/constant/assets.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'dart:math' as math;
import '../constant/dimens.dart';

class CustomDropdown extends StatefulWidget {
  final List<DropDownMenuItem> dropDownItemsList;
  final String? hintText;
  final DropDownMenuItem? selectedItem;
  final Function(DropDownMenuItem? selectedDropDownItem) onItemSelected;

  const CustomDropdown({
    super.key,
    required this.dropDownItemsList,
    required this.onItemSelected,
    this.hintText,
    this.selectedItem,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  DropDownMenuItem? selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = widget.selectedItem;
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
                  Text(item.itemName, style: AppStyles.style16Normal.copyWith(color: ColorValues.textGrayColor)),
                  Transform.rotate(
                    angle: (math.pi / 2),
                    child: CommonWidgets.fromSvg(svgAsset: SvgAssets.dropdownRightArrowIcon, height: Dimens.thirteen, width: Dimens.thirteen, boxFit: BoxFit.fill),
                  ),
                ],
              ),
            );
          } else {
            return DropdownMenuItem<DropDownMenuItem>(
              value: item,
              child: Text(item.itemName, style: AppStyles.style16Normal.copyWith(color: ColorValues.textGrayColor)),
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
          padding: EdgeInsets.only(top: Dimens.eight, left: Dimens.fifteen, bottom: Dimens.fifteen, right: Dimens.thirteen),
          decoration: BoxDecoration(
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(Dimens.seven),
            boxShadow: [BoxShadow(color: ColorValues.blackColor.withOpacity(0.08), blurRadius: 36, spreadRadius: 0, offset: const Offset(0, 0))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.selectedItem?.itemName ?? widget.hintText ?? '',
                style: AppStyles.style16Normal.copyWith(color: ColorValues.textGrayColor),
              ),
              CommonWidgets.fromSvg(svgAsset: SvgAssets.dropdownRightArrowIcon, height: Dimens.fourteen, width: Dimens.fifteen, boxFit: BoxFit.fill),
            ],
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: MediaQuery.of(context).size.height / 3.3,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [BoxShadow(color: ColorValues.blackColor.withOpacity(0.08), blurRadius: 36, spreadRadius: 0, offset: const Offset(0, 0))],
          ),
          elevation: 0,
          offset: Offset(0, Dimens.fortyTwo),
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
