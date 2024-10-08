import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/constant/styles.dart';
import 'package:galleon_advisors_app/modules/manage_position_detail/controller/manage_position_detail_controller.dart';
import 'package:galleon_advisors_app/utility/responsive.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../common/custom_primary_button.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../components/manage_position_detail_appbar.dart';

class ManagePositionDetailScreen extends StatelessWidget {
  final String positionId;
  final managePositionDetailController = Get.find<ManagePositionDetailController>();

  ManagePositionDetailScreen({super.key, required this.positionId}) {
    managePositionDetailController.getPositionData(positionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ManagePositionDetailAppbar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.thirty, left: Dimens.fifteen, right: Dimens.fifteen),
                decoration: BoxDecoration(
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.circular(Dimens.sixTeen),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Expanded(
                        child: managePositionDetailController.selectedActivityTab.value == 1
                            ? tipsAndTricksLayout()
                            : managePositionDetailController.selectedActivityTab.value == 0
                                ? opportunityFlagLayout(context)
                                : Row(
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

                    /// Opportunity Flag && Tips & Tricks buttons
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Obx(
                            () => CustomPrimaryButton(
                              margin: EdgeInsets.only(left: Dimens.twelve, right: Dimens.thirteen, top: Dimens.twenty),
                              btnText: StringValues.opportunityFlag.tr,
                              border: Border.all(
                                  color: managePositionDetailController.selectedActivityTab.value == 0 ? ColorValues.whiteColor : ColorValues.lightGrayColor, width: Dimens.one),
                              buttonColor:
                                  managePositionDetailController.selectedActivityTab.value == 0 ? ColorValues.fontLightGrayColor.withOpacity(0.25) : ColorValues.softWhiteColor,
                              borderRadius: BorderRadius.circular(Dimens.eight),
                              contentPadding: EdgeInsets.symmetric(vertical: Dimens.ten),
                              btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                              onTap: () {
                                managePositionDetailController.selectedActivityTab.value = 0;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => CustomPrimaryButton(
                              margin: EdgeInsets.only(left: Dimens.twelve, right: Dimens.twelve, top: Dimens.twenty),
                              btnText: StringValues.tipsAndTricks.tr,
                              border: Border.all(
                                  color: managePositionDetailController.selectedActivityTab.value == 1 ? ColorValues.whiteColor : ColorValues.lightGrayColor, width: Dimens.one),
                              buttonColor:
                                  managePositionDetailController.selectedActivityTab.value == 1 ? ColorValues.fontLightGrayColor.withOpacity(0.25) : ColorValues.softWhiteColor,
                              borderRadius: BorderRadius.circular(Dimens.eight),
                              contentPadding: EdgeInsets.symmetric(vertical: Dimens.ten),
                              btnTextStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                              onTap: () {
                                managePositionDetailController.selectedActivityTab.value = 1;
                              },
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: Dimens.eleven),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceActivitiesLayout() {
    return Container(
      margin: EdgeInsets.only(right: Dimens.five),
      padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.fifteen),
      decoration: BoxDecoration(
        color: ColorValues.primaryGreenColor.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.seven),
          topRight: Radius.circular(Dimens.seven),
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
          ).marginOnly(bottom: Dimens.thirtyThree),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: Dimens.thirteen, right: Dimens.thirteen),
              shrinkWrap: true,
              itemCount: managePositionDetailController.positionData.value?.serviceActivities?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: Dimens.five),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: Dimens.eighteen, vertical: Dimens.eleven),
                  decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.seven)),
                  child: Text(
                    managePositionDetailController.positionData.value?.serviceActivities?[index] ?? '',
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

  Widget oppThemesLayout() {
    return Container(
      margin: EdgeInsets.only(left: Dimens.six),
      padding: EdgeInsets.only(top: Dimens.eight, bottom: Dimens.fifteen),
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
              itemCount: managePositionDetailController.positionData.value?.oppThemes?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: Dimens.five),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: Dimens.eighteen, vertical: Dimens.eleven),
                  // height: Dimens.thirtySeven,
                  decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.seven)),
                  child: Text(
                    managePositionDetailController.positionData.value?.oppThemes?[index] ?? '',
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

  Widget tipsAndTricksLayout() {
    return Container(
      padding: EdgeInsets.only(top: Dimens.twentyOne, right: Dimens.ten, left: Dimens.thirtyTwo, bottom: Dimens.ten),
      decoration: BoxDecoration(
        color: ColorValues.whiteColor,
        borderRadius: BorderRadius.circular(Dimens.sixTeen),
      ),
      child: ListView(
        children: [
          CommonWidgets.autoSizeRichText(textSpans: [
            TextSpan(
              text: StringValues.server.tr,
              style: AppStyles.style16Normal.copyWith(
                color: ColorValues.blackColor,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: StringValues.role.tr,
              style: AppStyles.style16Normal.copyWith(
                color: ColorValues.blackColor,
              ),
            ),
          ], minFontSize: 12, maxFontSize: 16),
          Text(
            "- ${StringValues.inThisRoleWhenWeObserveWeAreCountingCovers.tr}",
            style: AppStyles.style16Normal,
          ),
          Text(
            "- ${StringValues.coversAreTheNumberOfQuestsThatAreSeatedAtTheTable.tr}",
            style: AppStyles.style16Normal,
          ),
          Text(
            StringValues.processOpportunities.tr,
            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor, decoration: TextDecoration.underline),
          ).marginOnly(top: Dimens.fifteen),
          Text(
            "- ${StringValues.lookOutForHowServersAreNavigatingAcrossSectionsAreTheyClosingStations.tr}",
            style: AppStyles.style16Normal,
          ),
          Text(
            "- ${StringValues.takeNoteOfWhereTheBussingStationsAreCanThisBeImproved.tr}",
            style: AppStyles.style16Normal,
          ),
          Text(
            "- ${StringValues.doBussingStationsHaveParStocksOrImagesOfWhatTheSetupShouldLookLike.tr}",
            style: AppStyles.style16Normal,
          ),
        ],
      ),
    );
  }

  Widget opportunityFlagLayout(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: Dimens.thirtyTwo, bottom: Dimens.sevenTeen),
        margin: EdgeInsets.only(top: Dimens.five, left: Dimens.twentyTwo, bottom: Dimens.eight, right: Dimens.twentySix),
        decoration: BoxDecoration(
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(Dimens.sixTeen),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              managePositionDetailController.opportunityFlagList.length,
              (index) {
                return Obx(
                  () => CustomPrimaryButton(
                    btnText: managePositionDetailController.opportunityFlagList[index],
                    buttonWidth: GetResponsiveDimens.widthDivTwoAndTwoPointEight(context),
                    textAlignment: Alignment.centerLeft,
                    contentPadding: EdgeInsets.symmetric(vertical: Dimens.ten, horizontal: Dimens.eleven),
                    margin: EdgeInsets.only(bottom: Dimens.sevenTeen),
                    borderRadius: BorderRadius.circular(7),
                    onTap: () {
                      managePositionDetailController.selectedOpportunityFlag.value = index;
                    },
                    border: Border.all(color: ColorValues.lightGrayColor, width: 1),
                    buttonColor:
                        managePositionDetailController.selectedOpportunityFlag.value == index ? ColorValues.primaryGreenAccentColor.withOpacity(0.25) : ColorValues.whiteColor,
                    btnTextStyle: AppStyles.style16Normal
                        .copyWith(color: managePositionDetailController.selectedOpportunityFlag.value == index ? ColorValues.primaryGreenColor : ColorValues.blackColor),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
