import 'package:flutter/cupertino.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/dimens.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:get/get.dart';

class DeleteStudies extends StatelessWidget {
  const DeleteStudies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorValues.whiteColor,
        borderRadius: BorderRadius.circular(Dimens.twelve),
      ),
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
