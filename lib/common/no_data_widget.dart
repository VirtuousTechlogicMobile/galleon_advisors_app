import 'package:flutter/material.dart';
import '../constant/dimens.dart';
import '../constant/styles.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    this.message,
    this.padding,
  });

  final String? message;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // SvgPicture.asset(
          //   SvgAssets.noData,
          //   width: Dimens.screenWidth * 0.25,
          //   height: Dimens.screenWidth * 0.25,
          // ),
          if (message != null) Dimens.boxHeight16,
          if (message != null)
            Text(
              message!,
              textAlign: TextAlign.center,
              style: AppStyles.style32Bold.copyWith(
                color: Theme.of(context).textTheme.titleSmall!.color,
              ),
            ),
        ],
      ),
    );
  }
}
