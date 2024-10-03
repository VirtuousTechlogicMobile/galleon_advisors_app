import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/common/custom_primary_button.dart';
import 'package:galleon_advisors_app/constant/strings.dart';
import 'package:galleon_advisors_app/modules/create_new_position/components/create_new_position_appbar.dart';
import 'package:galleon_advisors_app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../common/custom_textfield.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';
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
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CreateNewPositionAppbar(positionName: "Housekeeping - Driver"),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.six, left: Dimens.fourteen, right: Dimens.fifteen),
                padding: EdgeInsets.only(top: Dimens.twentyOne, left: Dimens.ten, right: Dimens.twelve),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.circular(Dimens.sixTeen),
                ),
                child: serviceFlagsLayout(),
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

  Widget serviceFlagsLayout() {
    return Container(
      width: Dimens.screenWidth / 2,
      height: Dimens.screenWidth / 3.5,
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: Dimens.fourPointFive, bottom: Dimens.nineteen),
      padding: EdgeInsets.only(top: Dimens.eight),
      decoration: BoxDecoration(
        color: ColorValues.primaryGreenColor.withOpacity(0.25),
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
              StringValues.opportunityFlag.tr,
              style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
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
                  textFieldHeight: Dimens.thirtyFive,
                  hintText: StringValues.typeName.tr,
                  borderRadius: BorderRadius.circular(Dimens.eight),
                  autofocus: true,
                  textAlign: TextAlign.left,
                  borderSide: BorderSide(width: Dimens.one, color: ColorValues.lightGrayColor),
                  contentPadding: EdgeInsets.only(top: Dimens.seven, bottom: Dimens.nine, left: Dimens.sixTeen, right: Dimens.twelve),
                  textStyle: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                  cursorColor: ColorValues.blackColor,
                  onSubmit: (p0) {
                    createPositionAddOppFlagController.addFlag();
                  },
                  onTapOutside: (p0) {
                    createPositionAddOppFlagController.addFlag();
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
                itemCount: createPositionAddOppFlagController.opportunityFlagList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: Dimens.five),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: Dimens.sevenTeen),
                    height: Dimens.thirtySeven,
                    decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.eight)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            createPositionAddOppFlagController.opportunityFlagList[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
                          ).marginOnly(right: Dimens.fifteen),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            '-',
                            style: AppStyles.style16Normal.copyWith(color: ColorValues.blackColor),
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

  Widget addButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: Dimens.five, left: Dimens.thirteen),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: Dimens.eleven),
          height: Dimens.thirtySeven,
          decoration: BoxDecoration(color: ColorValues.whiteColor, borderRadius: BorderRadius.circular(Dimens.eight)),
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
