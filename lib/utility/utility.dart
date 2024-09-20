import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/dimens.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/extension/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:get/get.dart';

abstract class AppUtility {
  /// Logger

  static final logger = TalkerFlutter.init();

  static void log(dynamic message, {String? tag}) {
    switch (tag) {
      case 'error':
        logger.error(message);
        break;
      case 'warning':
        logger.warning(message);
        break;
      case 'info':
        logger.info(message);
        break;
      case 'debug':
        logger.debug(message);
        break;
      case 'critical':
        logger.critical(message);
        break;
      default:
        logger.verbose(message);
        break;
    }
  }

  /// Show SnackBar

  static void showSnackBar(String message, {int? duration}) {
    if (Get.isSnackbarOpen) Get.back<void>();
    Get.showSnackbar(
      GetSnackBar(
        margin: EdgeInsets.only(
          left: Dimens.zero,
          right: Dimens.zero,
          top: Dimens.zero,
          bottom: Dimens.zero,
        ),
        borderRadius: Dimens.zero,
        padding: Dimens.edgeInsets16_12,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        borderWidth: Dimens.zero,
        messageText: Text(
          message.toCapitalized(),
          style: AppStyles.style14Normal.copyWith(
            color: ColorValues.whiteColor,
          ),
        ),
        shouldIconPulse: false,
        backgroundColor: Theme.of(Get.context!).snackBarTheme.backgroundColor!,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(seconds: duration ?? 3),
      ),
    );
  }
}
