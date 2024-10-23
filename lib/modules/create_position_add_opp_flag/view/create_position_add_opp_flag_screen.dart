import 'package:flutter/material.dart';
import 'package:galleon_user/common/custom_primary_button.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/modules/create_new_position/components/create_new_position_appbar.dart';
import 'package:galleon_user/routes/app_pages.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';
import '../../../common/custom_textfield.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
import '../../../theme/get_theme_wise_color.dart';
import '../controller/create_position_add_opp_flag_controller.dart';

class CreatePositionAddOppFlagScreen extends StatelessWidget {
  CreatePositionAddOppFlagScreen({super.key});

  final createPositionAddOppFlagController = Get.find<CreatePositionAddOppFlagController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.appBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        left: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CreateNewPositionAppbar(positionName: "Housekeeping - Driver"),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.nine, left: Dimens.fourteen, right: Dimens.fifteen),
                padding: EdgeInsets.only(top: Dimens.twentyOne, left: Dimens.ten, right: Dimens.twelve),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.circular(Dimens.sixTeen),
                ),
                child: serviceFlagsLayout(context),
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
                contentPadding: EdgeInsets.symmetric(vertical: GetResponsiveDimens.twentyFiveAndTwentyOne(context)),
                btnTextColor: ColorValues.whiteColor,
                margin: EdgeInsets.symmetric(vertical: Dimens.eight, horizontal: Dimens.fourteen),
                borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
                buttonColor: ColorValues.primaryGreenColor,
                border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
                onTap: () {
                  Get.toNamed(AppRoutes.createPositionTipsAndTricks);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceFlagsLayout(BuildContext context) {
    return Container(
      width: Get.width / 1.8,
      height: GetResponsiveDimens.widthDivTheePointFive(context),
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: Dimens.fourPointFive, bottom: Dimens.nineteen),
      padding: EdgeInsets.only(top: Dimens.eight),
      decoration: BoxDecoration(
        color: ColorValues.primaryGreenColor.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.seven),
          topRight: Radius.circular(Dimens.seven),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              StringValues.opportunityFlag.tr,
              style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ).marginOnly(bottom: Dimens.twentyNine, left: Dimens.fifty, right: Dimens.fifty),
          ),
          InkWell(
            onTap: () {
              createPositionAddOppFlagController.isOppAddButtonTapped.value = true;
            },
            child: Obx(
              () => Visibility(
                visible: !createPositionAddOppFlagController.isOppAddButtonTapped.value,
                replacement: CustomTextField(
                  controller: createPositionAddOppFlagController.oppFlagController,
                  fillColor: ColorValues.softWhiteColor,
                  hintText: StringValues.typeName.tr,
                  borderRadius: BorderRadius.circular(Dimens.eight),
                  autofocus: true,
                  textAlign: TextAlign.left,
                  borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
                  contentPadding: EdgeInsets.only(top: Dimens.eleven, bottom: Dimens.twelve, left: Dimens.sixTeen, right: Dimens.twelve),
                  textStyle: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
                  cursorColor: ColorValues.blackColor,
                  onSubmit: (p0) {
                    createPositionAddOppFlagController.addFlag();
                  },
                  onTapOutside: (p0) {
                    createPositionAddOppFlagController.addFlag();
                  },
                  maxLines: 1,
                ).marginOnly(bottom: Dimens.five, left: Dimens.thirteen, right: Dimens.thirteen),
                child: addButton(context),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.only(left: Dimens.fifteen, right: Dimens.fifteen, bottom: Dimens.twentyThree),
                shrinkWrap: true,
                itemCount: createPositionAddOppFlagController.opportunityFlagList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: Dimens.five),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: Dimens.nineteen, vertical: Dimens.eleven),
                    decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.seven)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            createPositionAddOppFlagController.opportunityFlagList[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
                          ).marginOnly(right: Dimens.fifteen),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            '-',
                            style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: Dimens.five, left: Dimens.fifteen),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: Dimens.eighteen, vertical: Dimens.eleven),
          decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.seven)),
          child: Text(
            "${StringValues.add.tr} +",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GetThemeStyles.getStyle16Normal(context)?.copyWith(color: ColorValues.blackColor),
          ).marginOnly(right: Dimens.fifteen),
        ),
      ],
    );
  }
}
