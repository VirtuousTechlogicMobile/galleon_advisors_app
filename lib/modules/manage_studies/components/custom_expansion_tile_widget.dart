import 'package:flutter/material.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/utility/responsive.dart';
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
  final bool isShowStar;

  const CustomExpansionTileWidget({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    this.children,
    this.isShowGreenDot = false,
    this.isShowStar = false,
    this.padding,
  });

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
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(GetResponsiveDimens.tenAndEight(context)), bottomRight: Radius.circular(GetResponsiveDimens.tenAndEight(context))),
            ),
            child: isExpanded
                ? Column(
                    children: children ?? [],
                  ).paddingOnly(
                    top: padding?.top ?? GetResponsiveDimens.eightyAndEighteen(context),
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
            height: GetResponsiveDimens.hundredTenAndFiftyOne(context),
            padding: EdgeInsets.only(left: Dimens.fifteen, right: Dimens.twenty),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorValues.whiteColor,
              borderRadius: BorderRadius.circular(Dimens.ten),
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
                if (isShowStar)
                  Icon(
                    Icons.star,
                    size: GetResponsiveDimens.fiftyAndTwentyTwo(context),
                    color: ColorValues.primaryGreenColor,
                  ).marginOnly(left: Dimens.five),
                if (isShowGreenDot)
                  Container(
                    margin: EdgeInsets.only(left: Dimens.seven),
                    width: GetResponsiveDimens.thirtySixAndEighteen(context),
                    height: GetResponsiveDimens.thirtySixAndEighteen(context),
                    decoration: const BoxDecoration(color: ColorValues.primaryGreenColor, shape: BoxShape.circle),
                  ),
                const Spacer(),
                if (isExpanded)
                  CommonWidgets.fromSvg(
                    svgAsset: SvgAssets.downArrowIcon,
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
