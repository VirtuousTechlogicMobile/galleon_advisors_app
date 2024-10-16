import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/dimens.dart';
import 'package:flutter/cupertino.dart';

class NxNetworkImage extends StatelessWidget {
  const NxNetworkImage({
    super.key,
    required this.imageUrl,
    this.radius,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.imageFit,
  });

  final String imageUrl;
  final double? radius;
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final BoxFit? imageFit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? Get.width,
        maxHeight: maxHeight ?? Dimens.screenHeight,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: imageFit ?? BoxFit.cover,
          placeholder: (ctx, url) => Container(
            width: width,
            height: height,
            color: Theme.of(context).dividerColor,
          ),
          errorWidget: (ctx, url, err) => const Icon(
            CupertinoIcons.info,
            color: ColorValues.errorColor,
          ),
        ),
      ),
    );
  }
}
