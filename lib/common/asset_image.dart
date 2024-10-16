import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';

class NxAssetImage extends StatelessWidget {
  const NxAssetImage({
    super.key,
    required this.imgAsset,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.scale,
    this.fit,
  });

  final String imgAsset;
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final double? scale;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? Get.width,
        maxHeight: maxHeight ?? Dimens.screenHeight,
      ),
      child: Image.asset(
        imgAsset,
        fit: fit ?? BoxFit.contain,
        errorBuilder: (ctx, url, err) {
          log("Error to Load Image : $err");
          return const Icon(
            CupertinoIcons.info,
            color: ColorValues.errorColor,
          );
        },
        width: width,
        height: height,
        scale: scale ?? 1.0,
      ),
    );
  }
}
