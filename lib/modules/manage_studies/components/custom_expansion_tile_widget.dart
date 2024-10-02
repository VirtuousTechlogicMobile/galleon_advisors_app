import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';

class CustomExpansionTileWidget extends StatelessWidget {
  final bool isExpanded;
  final Function() onTap;
  final EdgeInsets? padding;
  final List<Widget>? children;
  final String title;
  final bool isShowGreenDot;

  const CustomExpansionTileWidget({super.key, required this.title, required this.isExpanded, required this.onTap, this.children, this.isShowGreenDot = false, this.padding});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSize(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 200),
          reverseDuration: const Duration(milliseconds: 200),
          child: Container(
            padding: isExpanded ? EdgeInsets.only(top: Dimens.forty) : EdgeInsets.zero,
            margin: EdgeInsets.symmetric(horizontal: Dimens.three, vertical: Dimens.four),
            decoration: BoxDecoration(
              color: ColorValues.whiteColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimens.eight), bottomRight: Radius.circular(Dimens.eight)),
            ),
            child: isExpanded
                ? Column(
                    children: children ?? [],
                  ).paddingOnly(
                    top: padding?.top ?? Dimens.eighteen,
                    left: padding?.left ?? Dimens.sixTeen,
                    bottom: padding?.bottom ?? Dimens.sixTeen,
                    right: padding?.right ?? Dimens.twentyTwo,
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
                if (isExpanded)
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
                  title,
                  style: AppStyles.style16Normal.copyWith(color: ColorValues.darkSlateGrayColor),
                ),
                if (isShowGreenDot)
                  Container(
                    margin: EdgeInsets.only(left: Dimens.fifteen),
                    width: Dimens.eighteen,
                    height: Dimens.eighteen,
                    decoration: const BoxDecoration(color: ColorValues.primaryGreenColor, shape: BoxShape.circle),
                  ),
                const Spacer(),
                if (isExpanded)
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
