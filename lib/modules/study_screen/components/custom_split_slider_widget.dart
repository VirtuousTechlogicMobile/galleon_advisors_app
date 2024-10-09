import 'package:flutter/material.dart';
import 'package:galleon_user/constant/colors.dart';
import 'package:galleon_user/utility/responsive.dart';
import 'package:get/get.dart';

import '../../../constant/dimens.dart';
import '../../../constant/styles.dart';

class CustomSplitSliderWidget extends StatelessWidget {
  final double sliderValue;
  final Function(double value) onChangeSliderValue;
  const CustomSplitSliderWidget({super.key, required this.sliderValue, required this.onChangeSliderValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetResponsiveDimens.sixtyAndThirtyFive(context),
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: Dimens.twentyTwo, right: Dimens.twentySix, bottom: Dimens.nine),
      decoration: BoxDecoration(
        border: Border.all(color: ColorValues.lightGrayColor, width: Dimens.one),
        borderRadius: BorderRadius.circular(GetResponsiveDimens.tenAndEight(context)),
        color: ColorValues.whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: GetResponsiveDimens.seventyFiveAndOneHundredFifty(context),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${(100 - sliderValue).toStringAsFixed(0)} %',
                style: AppStyles.style16SemiBold.copyWith(color: ColorValues.primaryGreenColor),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackShape: DottedSliderTrack(),
                thumbColor: Colors.green,
                tickMarkShape: SliderTickMarkShape.noTickMark,
                activeTrackColor: Colors.transparent,
                overlayShape: SliderComponentShape.noOverlay,
                showValueIndicator: ShowValueIndicator.never,
                inactiveTrackColor: Colors.transparent,
                thumbShape: CustomOverlayShape(context),
                overlayColor: Colors.transparent,
              ),
              child: Slider(
                value: sliderValue,
                min: 1,
                max: 99,
                divisions: 99,
                label: '${sliderValue.round()}',
                onChanged: (value) => onChangeSliderValue(value),
              ),
            ).paddingOnly(top: Dimens.five),
          ),
          SizedBox(
            width: GetResponsiveDimens.seventyFiveAndOneHundredFifty(context),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${sliderValue.toStringAsFixed(0)} %',
                style: AppStyles.style16SemiBold.copyWith(color: ColorValues.primaryGreenColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomOverlayShape extends SliderComponentShape {
  BuildContext buildContext;
  CustomOverlayShape(this.buildContext);
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(Dimens.ten, Dimens.fifty); // Custom size for the overlay
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final Offset shiftedCenter = center.translate(0, -Dimens.three);
    final Rect overlayRect = Rect.fromCenter(
      center: shiftedCenter,
      width: Dimens.four, // The width of the vertical bar
      height: GetResponsiveDimens.sixtyAndThirtyFive(buildContext) - Dimens.two, // The height of the vertical bar
    );

    final Paint paint = Paint()..color = ColorValues.primaryGreenColor;

    // Draw the vertical rectangular overlay
    canvas.drawRect(overlayRect, paint);
  }
}

// Custom track shape for dotted line
class DottedSliderTrack extends SliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset? offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    final double trackLeft = offset!.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final Canvas canvas = context.canvas;

    // Get track bounds
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Paint paint = Paint()
      ..color = ColorValues.primaryGreenAccentColor
      ..strokeWidth = trackRect.height
      ..style = PaintingStyle.fill;

    // Draw the entire slider track as a dotted line (this is now static)
    _drawDottedLine(canvas, Offset(trackRect.left, trackRect.top), Offset(trackRect.right, trackRect.top), paint);
  }

  // Method to draw a dotted line
  void _drawDottedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    double dashWidth = Dimens.three; // Width of each dash
    double dashHeight = Dimens.three; // Height of each dash
    double dashSpace = Dimens.three; // Space between each dash
    final double totalDistance = (end - start).distance;
    double startX = 0.0;

    while (startX < totalDistance) {
      final double x = start.dx + (end.dx - start.dx) * (startX / totalDistance);
      final double y = start.dy + (end.dy - start.dy) * (startX / totalDistance);
      canvas.drawRect(
        Rect.fromLTWH(x, y - 1, dashWidth, dashHeight), // Adjust height/width for rectangle
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }
}
