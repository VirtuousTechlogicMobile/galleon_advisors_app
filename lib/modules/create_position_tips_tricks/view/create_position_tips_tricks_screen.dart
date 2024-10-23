import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/modules/create_new_position/components/create_new_position_appbar.dart';
import 'package:galleon_user/modules/create_position_tips_tricks/controller/create_position_tips_tricks_controller.dart';
import 'package:get/get.dart';
import '../../../common/common_widgets.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/get_theme_wise_color.dart';
import '../../../utility/responsive.dart';

class CreatePositionTipsTricksScreen extends StatelessWidget {
  CreatePositionTipsTricksScreen({super.key});

  final createPositionTipsTricksController = Get.find<CreatePositionTipsTricksController>();

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
                width: Get.width,
                margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.nine, left: Dimens.fourteen, right: Dimens.fifteen),
                padding: EdgeInsets.only(top: Dimens.ten, left: Dimens.thirty, right: Dimens.twelve),
                decoration: BoxDecoration(
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.circular(Dimens.sixTeen),
                ),
                child: tipsAndTricksLayout(context),
              ),
            ),
            // bottom bar
            Container(
              height: GetResponsiveDimens.getBottomBarButtonHeight(context),
              alignment: Alignment.centerRight,
              color: ColorValues.whiteColor,
              child: CustomPrimaryButton(
                buttonWidth: GetResponsiveDimens.widthDivFourAndTwoHundredForty(context),
                btnText: StringValues.create.tr,
                btnTextColor: ColorValues.whiteColor,
                margin: EdgeInsets.symmetric(vertical: Dimens.eight, horizontal: Dimens.fourteen),
                borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.twentyFiveAndTwentyOne(context)),
                buttonColor: ColorValues.primaryGreenColor,
                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                onTap: () {
                  Get.toNamed(AppRoutes.createNewStudy);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tipsAndTricksLayout(BuildContext context) {
    return ListView(
      children: [
        Text(
          StringValues.tipsAndTricks.tr,
          style: GetThemeStyles.getStyle16Normal(context),
        ).marginOnly(left: Dimens.oneHundredSixty, bottom: Dimens.four),
        CommonWidgets.autoSizeRichText(textSpans: [
          TextSpan(
            text: StringValues.server.tr,
            style: GetThemeStyles.getStyle16Normal(context)?.copyWith(
              color: ColorValues.blackColor,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: StringValues.role.tr,
            style: GetThemeStyles.getStyle16Normal(context)?.copyWith(
              color: ColorValues.blackColor,
            ),
          ),
        ], minFontSize: 12, maxFontSize: 16),
        Text(
          "- ${StringValues.inThisRoleWhenWeObserveWeAreCountingCovers.tr}",
          style: GetThemeStyles.getStyle16Normal(context),
        ),
        Text(
          "- ${StringValues.coversAreTheNumberOfQuestsThatAreSeatedAtTheTable.tr}",
          style: GetThemeStyles.getStyle16Normal(context),
        ),
        Text(
          StringValues.processOpportunities.tr,
          style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor, decoration: TextDecoration.underline),
        ).marginOnly(top: Dimens.fifteen),
        Text(
          "- ${StringValues.lookOutForHowServersAreNavigatingAcrossSectionsAreTheyClosingStations.tr}",
          style: GetThemeStyles.getStyle16Normal(context),
        ),
        Text(
          "- ${StringValues.takeNoteOfWhereTheBussingStationsAreCanThisBeImproved.tr}",
          style: GetThemeStyles.getStyle16Normal(context),
        ),
        Text(
          "- ${StringValues.doBussingStationsHaveParStocksOrImagesOfWhatTheSetupShouldLookLike.tr}",
          style: GetThemeStyles.getStyle16Normal(context),
        ),
      ],
    );
  }
}
