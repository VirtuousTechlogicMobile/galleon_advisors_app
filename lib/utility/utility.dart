import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/dimens.dart';
import 'package:galleon_user/constant/styles.dart';
import 'package:galleon_user/extension/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  static String getTimeDifference(String startTime, String endTime) {
    // Define the format for the times
    final DateFormat format = DateFormat('HH:mm:ss');

    // Parse the input times
    DateTime start = format.parse(startTime);
    DateTime end = format.parse(endTime);

    // Calculate the difference between the two times
    Duration difference = end.difference(start);

    // Check if the time difference crosses midnight (next day)
    if (difference.isNegative) {
      // Add one day (24 hours) if the time crosses midnight
      difference = difference + Duration(days: 1);
    }

    // Convert the duration to a human-readable string
    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} sec";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} days";
    } else {
      return "${difference.inDays ~/ 30} months";
    }
  }
}
