import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/constant/colors.dart';
import 'package:galleon_advisors_app/constant/dimens.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:get/get.dart';

import 'custom_primary_button.dart';

class DeleteStudies extends StatelessWidget {
  const DeleteStudies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(Dimens.twelve),
          ),
          padding: EdgeInsets.symmetric(horizontal: Dimens.thirty, vertical: Dimens.twentyFour),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPrimaryButton(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: Dimens.sixTeen,
                      horizontal: Dimens.fourty,
                    ),
                    buttonColor: Colors.transparent,
                    buttonBorderColor: ColorValues.primaryGreenColor,
                    btnText: StringValues.cancle.tr,
                    btnTextColor: ColorValues.primaryGreenColor,
                    btnTextStyle: AppStyles.style18Bold.copyWith(fontWeight: FontWeight.w600),
                    onTap: () {},
                  ),
                  Dimens.boxWidth40,
                  CustomPrimaryButton(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: Dimens.sixTeen,
                      horizontal: Dimens.fourty,
                    ),
                    buttonColor: ColorValues.primaryColor,
                    btnText: StringValues.delete.tr,
                    btnTextStyle: AppStyles.style18Bold.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorValues.whiteColor,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
