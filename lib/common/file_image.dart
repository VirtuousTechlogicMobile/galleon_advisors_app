import 'dart:io';

import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/dimens.dart';
import 'package:flutter/cupertino.dart';

class NxFileImage extends StatelessWidget {
  const NxFileImage({
    Key? key,
    required this.file,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.scale,
    this.fit,
  }) : super(key: key);

  final File file;
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
        maxWidth: maxWidth ?? Dimens.screenWidth,
        maxHeight: maxHeight ?? Dimens.screenHeight,
      ),
      child: Image.file(
        file,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (ctx, url, err) => const Icon(
          CupertinoIcons.info,
          color: ColorValues.errorColor,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
