import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/modules/create_new_position/components/create_new_position_appbar.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../common/custom_textfield.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../../../utility/responsive.dart';
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
        left: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CreateNewPositionAppbar(positionName: "Housekeeping - Driver"),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.sevenTeen, bottom: Dimens.eight, left: Dimens.fourteen, right: Dimens.fifteen),
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
            // bottom bar
            Container(
              height: GetResponsiveDimens.getBottomBarButtonHeight(context),
              alignment: Alignment.centerRight,
              color: ColorValues.whiteColor,
              child: CustomPrimaryButton(
                buttonWidth: GetResponsiveDimens.widthDivFourAndTwoHundredForty(context),
                btnText: StringValues.next.tr,
                btnTextColor: ColorValues.whiteColor,
                margin: EdgeInsets.symmetric(vertical: GetResponsiveDimens.tenAndEight(context), horizontal: GetResponsiveDimens.twentyAndFourteen(context)),
                borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.twentyFiveAndTwentyOne(context)),
                buttonColor: ColorValues.primaryGreenColor,
                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                onTap: () {
                  Get.toNamed(AppRoutes.addOpportunityFlags);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceActivitiesLayout() {
    return Container(
      margin: EdgeInsets.only(right: Dimens.fourPointFive, bottom: Dimens.nineteen),
      padding: EdgeInsets.only(top: Dimens.eight),
      decoration: BoxDecoration(
        color: ColorValues.primaryGreenColor.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.nine),
          topRight: Radius.circular(Dimens.nine),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              StringValues.serviceActivities.tr,
              style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ).marginOnly(bottom: Dimens.twentyNine, left: Dimens.fifty, right: Dimens.fifty),
          ),
          InkWell(
            onTap: () {
              createPositionAddOppAndServiceController.isServiceAddButtonTapped.value = true;
            },
            child: Obx(
              () => Visibility(
                visible: !createPositionAddOppAndServiceController.isServiceAddButtonTapped.value,
                replacement: CustomTextField(
                  controller: createPositionAddOppAndServiceController.positionNameController,
                  fillColor: ColorValues.softWhiteColor,
                  // textFieldHeight: Dimens.thirtyFive,
                  hintText: StringValues.typeName.tr,
                  borderRadius: BorderRadius.circular(Dimens.seven),
                  autofocus: true,
                  textAlign: TextAlign.left,
                  borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
                  contentPadding: EdgeInsets.only(top: Dimens.eleven, bottom: Dimens.twelve, left: Dimens.sixTeen, right: Dimens.twelve),
                  textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                  cursorColor: ColorValues.blackColor,
                  onSubmit: (p0) {
                    createPositionAddOppAndServiceController.addPosition();
                  },
                  onTapOutside: (p0) {
                    createPositionAddOppAndServiceController.addPosition();
                  },
                  maxLines: 1,
                ).marginOnly(bottom: Dimens.five, left: Dimens.thirteen, right: Dimens.thirteen),
                child: addButton(),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.only(left: Dimens.thirteen, right: Dimens.thirteen, bottom: Dimens.twentyThree),
                shrinkWrap: true,
                itemCount: createPositionAddOppAndServiceController.serviceActivitiesList.length,
                itemBuilder: (context, index) {
                  return activitiesOppComponent(
                    name: createPositionAddOppAndServiceController.serviceActivitiesList[index],
                    onTapRemove: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget oppThemesLayout() {
    return Container(
      margin: EdgeInsets.only(left: Dimens.fourPointFive, bottom: Dimens.nineteen),
      padding: EdgeInsets.only(top: Dimens.eight),
      decoration: BoxDecoration(
        color: ColorValues.fontLightGrayColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.eight),
          topRight: Radius.circular(Dimens.eight),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              StringValues.opportunityThemes.tr,
              style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ).marginOnly(bottom: Dimens.twentyNine, left: Dimens.fifty, right: Dimens.fifty),
          ),

          /// add Opportunity button
          InkWell(
            onTap: () {
              createPositionAddOppAndServiceController.isOppAddButtonTapped.value = true;
            },
            child: Obx(
              () => Visibility(
                visible: !createPositionAddOppAndServiceController.isOppAddButtonTapped.value,
                replacement: CustomTextField(
                  controller: createPositionAddOppAndServiceController.opportunityController,
                  fillColor: ColorValues.softWhiteColor,
                  hintText: StringValues.typeName.tr,
                  borderRadius: BorderRadius.circular(Dimens.seven),
                  autofocus: true,
                  textAlign: TextAlign.left,
                  borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
                  contentPadding: EdgeInsets.only(top: Dimens.eleven, bottom: Dimens.twelve, left: Dimens.sixTeen, right: Dimens.twelve),
                  textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                  cursorColor: ColorValues.blackColor,
                  onSubmit: (p0) {
                    createPositionAddOppAndServiceController.addOpportunity();
                  },
                  onTapOutside: (p0) {
                    createPositionAddOppAndServiceController.addOpportunity();
                  },
                  maxLines: 1,
                ).marginOnly(bottom: Dimens.five, left: Dimens.thirteen, right: Dimens.thirteen),
                child: addButton(),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.only(left: Dimens.thirteen, right: Dimens.thirteen, bottom: Dimens.twentyThree),
                shrinkWrap: true,
                itemCount: createPositionAddOppAndServiceController.opportunityThemesList.length,
                itemBuilder: (context, index) {
                  return activitiesOppComponent(
                    name: createPositionAddOppAndServiceController.opportunityThemesList[index],
                    onTapRemove: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget activitiesOppComponent({required String name, required Function() onTapRemove}) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimens.five),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: Dimens.eighteen, vertical: Dimens.eleven),
      decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.seven)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            ).marginOnly(right: Dimens.fifteen),
          ),
          InkWell(
            onTap: onTapRemove(),
            child: Text(
              '-',
              style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget addButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: Dimens.five, left: Dimens.thirteen),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: Dimens.eighteen, vertical: Dimens.eleven),
          decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.seven)),
          child: Text(
            "${StringValues.add.tr} +",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
          ).marginOnly(right: Dimens.fifteen),
        ),
      ],
    );
  }
}
