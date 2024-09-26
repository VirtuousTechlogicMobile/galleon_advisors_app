import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/styles.dart';

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
        return Stack(
          alignment: Alignment.center,
          children: [
            ListWheelScrollView.useDelegate(
              controller: FixedExtentScrollController(initialItem: selectedIndex),
              physics: isScroll ? const FixedExtentScrollPhysics() : const NeverScrollableScrollPhysics(),
              itemExtent: Dimens.sixty,
              diameterRatio: 100,
              onSelectedItemChanged: (index) {
                // Use modulo to loop around the index for infinite scrolling
                onSelectedItemChanged(index % itemsList.length);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return Container(
                    color: ColorValues.softWhiteColor,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
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
                height: Dimens.fortyThree,
                // margin: EdgeInsets.only(bottom: Dimens.forty),
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
