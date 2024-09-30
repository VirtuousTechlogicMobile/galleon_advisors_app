import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/constant/styles.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';

class CustomExpansionTileWidget extends StatelessWidget {
  final bool isExpanded;
  final Function() onTap;
  final List<Widget>? children;
  const CustomExpansionTileWidget({super.key, required this.isExpanded, required this.onTap, this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: Container(
            padding: isExpanded ? EdgeInsets.only(top: Dimens.forty) : EdgeInsets.zero,
            margin: EdgeInsets.symmetric(horizontal: Dimens.three, vertical: Dimens.four),
            decoration: BoxDecoration(
              color: ColorValues.whiteColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.eight), bottomRight: Radius.circular(Dimens.eight)),
            ),
            child: isExpanded
                ? Column(
                    children: [
                      CheckboxListTile(
                        title: Text("Select All"),
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      CheckboxListTile(
                        title: Text("Study Name"),
                        value: false,
                        onChanged: (bool? value) {},
                        controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
                      ),
                      CheckboxListTile(
                        title: Text("Test"),
                        value: false,
                        onChanged: (bool? value) {},
                        controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
                      ),
                    ],
                  )
                : const Row(),
          ),
        ),
        InkWell(
          onTap: () => onTap(),
          child: Container(
            height: Dimens.fiftyOne,
            padding: EdgeInsets.only(left: Dimens.fifteen, right: Dimens.twenty),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorValues.whiteColor,
              borderRadius: BorderRadius.circular(Dimens.eight),
              boxShadow: [
                BoxShadow(
                  color: ColorValues.blackColor.withOpacity(0.10),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Food & Beverage - Barista',
                  style: AppStyles.style16Normal.copyWith(color: ColorValues.darkSlateGrayColor),
                ),
                const Spacer(),
                CommonWidgets.fromSvg(
                  svgAsset: SvgAssets.downArrowIcon,
                  height: Dimens.eight,
                  width: Dimens.eight,
                  boxFit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
