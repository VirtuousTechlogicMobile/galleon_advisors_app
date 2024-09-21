import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../constant/styles.dart';

class UploadStudies extends StatelessWidget {
  const UploadStudies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.thirty, vertical: Dimens.twentyFour),
      child: Column(
        children: [
          Text(
            StringValues.deleteStudies.tr,
            style: AppStyles.style24Bold.copyWith(
              color: ColorValues.errorColor,
            ),
          ),
          Text(
            StringValues.deleteDesc.tr,
            style: AppStyles.style24Bold.copyWith(
              color: ColorValues.errorColor,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
