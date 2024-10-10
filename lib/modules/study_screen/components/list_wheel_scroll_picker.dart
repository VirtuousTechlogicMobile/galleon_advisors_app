import 'package:flutter/material.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/utility/responsive.dart';

import '../../../constant/dimens.dart';

class ListWheelScrollPicker extends StatelessWidget {
  final List<String> itemsList;
  final Function(int selectedValue) onSelectedItemChanged;
  final int selectedIndex;
  final bool isScroll;

  const ListWheelScrollPicker({
    super.key,
    required this.itemsList,
    required this.onSelectedItemChanged,
    required this.selectedIndex,
    this.isScroll = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableHeight = constraints.maxHeight;
        double itemExtent = Responsive.isMobile(context) ? availableHeight / 5 : availableHeight / 9;
        return Stack(
          alignment: Alignment.center,
          children: [
            ListWheelScrollView.useDelegate(
              controller: FixedExtentScrollController(initialItem: selectedIndex),
              physics: isScroll ? const FixedExtentScrollPhysics() : const NeverScrollableScrollPhysics(),
              itemExtent: itemExtent /*GetResponsiveDimens.eightyAndSixty(context)*/,
              diameterRatio: 100,
              onSelectedItemChanged: (index) {
                // Use modulo to loop around the index for infinite scrolling
                onSelectedItemChanged(index % itemsList.length);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimens.eight),
                    color: ColorValues.softWhiteColor,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      itemsList[index % itemsList.length],
                      style: selectedIndex == (index % itemsList.length)
                          ? AppStyles.style16SemiBold.copyWith(color: ColorValues.primaryGreenColor)
                          : AppStyles.style16Normal.copyWith(color: ColorValues.fontLightGrayColor),
                    ),
                  );
                },
                childCount: null,
              ),
            ),
            IgnorePointer(
              child: Container(
                height: GetResponsiveDimens.fortyThreeAndSeventy(context),
                margin: EdgeInsets.only(top: GetResponsiveDimens.eightAndZero(context)),
                width: double.infinity,
                color: ColorValues.primaryGreenAccentColor.withOpacity(0.20),
              ),
            ),
          ],
        );
      },
    );
  }
}
