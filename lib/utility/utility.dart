import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/constant/dimens.dart';
import 'package:galleon_user/extension/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:get/get.dart';
import '../theme/get_theme_wise_color.dart';

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
          style: GetThemeStyles.getStyle14Normal(Get.context!)?.copyWith(
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

  static Future<bool> checkNetwork() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  static String fromTimeStampToString({required Timestamp timeStamp}) {
    return timeStamp.toString();
  }

  static Timestamp fromStringToTimestamp({required String timeStampString}) {
    // Create a DateFormat matching the string format
    DateFormat dateFormat = DateFormat("MMMM d, y 'at' h:mm:ss a 'UTC'xxx");

    // Convert the string to a DateTime object
    DateTime dateTime = dateFormat.parse(timeStampString);

    // Convert DateTime to Firestore Timestamp
    return Timestamp.fromDate(dateTime);
  }

  static String fromListToString({required List<String> list}) {
    String formattedString = list.join(',');
    return formattedString;
  }

  static List<String> fromStringToList({required String string}) {
    List<String> formattedList = string.split(",");
    return formattedList;
  }

  static String fromDateToString({required DateTime date}) {
    return date.toString();
  }

  static String fromDateListToSqliteString({required List<DateTime?> list}) {
    List<String> formattedList = [];
    for (var dateTime in list) {
      if(dateTime != null) {
        formattedList.add(fromDateToString(date: dateTime));
      }
    }
    return formattedList.join(',');
  }
}
