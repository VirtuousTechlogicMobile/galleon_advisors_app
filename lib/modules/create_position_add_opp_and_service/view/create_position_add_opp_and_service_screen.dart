import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/modules/create_new_position/components/create_new_position_appbar.dart';
import 'package:get/get.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../controller/create_position_add_opp_and_service_controller.dart';

class CreatePositionAddOppAndServiceScreen extends StatelessWidget {
  CreatePositionAddOppAndServiceScreen({super.key});

  final createPositionAddOppAndServiceController = Get.find<CreatePositionAddOppAndServiceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CreateNewPositionAppbar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.six, left: Dimens.fourteen, right: Dimens.fifteen),
                decoration: BoxDecoration(
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.circular(Dimens.sixTeen),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: serviceActivitiesLayout(),
                    ),
                    Expanded(
                      child: oppThemesLayout(),
                    ),
                  ],
                ).marginOnly(top: Dimens.twentyOne, left: Dimens.ten, right: Dimens.twelve),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              color: ColorValues.whiteColor,
              child: CustomPrimaryButton(
                buttonHeight: Dimens.fiftySix,
                buttonWidth: Dimens.twoHundredEighteen,
                btnText: StringValues.next.tr,
                btnTextColor: ColorValues.whiteColor,
                margin: EdgeInsets.symmetric(vertical: Dimens.eight, horizontal: Dimens.fourteen),
                borderRadius: BorderRadius.circular(Dimens.eight),
                buttonColor: ColorValues.primaryGreenColor,
                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceActivitiesLayout() {
    return Container(
      margin: EdgeInsets.only(right: Dimens.fourPointFive),
      padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.eleven),
      decoration: BoxDecoration(
        color: ColorValues.primaryGreenColor.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.eight),
          topRight: Radius.circular(Dimens.eight),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            StringValues.serviceActivities.tr,
            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).marginOnly(bottom: Dimens.twentyNine),
          ListView.builder(
            padding: EdgeInsets.only(left: Dimens.thirteen, right: Dimens.thirteen),
            shrinkWrap: true,
            itemCount: createPositionAddOppAndServiceController.positionData.value?.serviceActivities?.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: Dimens.five),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: Dimens.sevenTeen),
                height: Dimens.thirtySeven,
                decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.eight)),
                child: Text(
                  createPositionAddOppAndServiceController.positionData.value?.serviceActivities?[index] ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget oppThemesLayout() {
    return Container(
      margin: EdgeInsets.only(left: Dimens.fourPointFive),
      padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.eleven),
      decoration: BoxDecoration(
        color: ColorValues.fontLightGrayColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.eight),
          topRight: Radius.circular(Dimens.eight),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            StringValues.opportunityThemes.tr,
            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).marginOnly(bottom: Dimens.twentyNine),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: Dimens.thirteen, right: Dimens.thirteen),
              shrinkWrap: true,
              itemCount: createPositionAddOppAndServiceController.positionData.value?.oppThemes?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: Dimens.five),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: Dimens.sevenTeen),
                  height: Dimens.thirtySeven,
                  decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.eight)),
                  child: Text(
                    createPositionAddOppAndServiceController.positionData.value?.oppThemes?[index] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
