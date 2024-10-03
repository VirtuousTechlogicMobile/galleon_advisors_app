import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/styles.dart';
import 'common_widgets.dart';

class TextFieldWithLabel extends StatefulWidget {
  final String labelText;
  final Widget textField;
  final FocusNode focusNode;

  const TextFieldWithLabel({
    super.key,
    required this.textField,
    required this.labelText,
    required this.focusNode,
  });

  @override
  State<TextFieldWithLabel> createState() => _TextFieldWithLabelState();
}

class _TextFieldWithLabelState extends State<TextFieldWithLabel> {
  late bool isFocused;

  @override
  void initState() {
    super.initState();
    isFocused = widget.focusNode.hasFocus;

    // Listen to focus changes
    widget.focusNode.addListener(() {
      setState(() {
        isFocused = widget.focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppStyles.style16Normal.copyWith(color: isFocused ? ColorValues.primaryGreenColor.withOpacity(0.50) : ColorValues.blackColor.withOpacity(0.50)),
        ).marginOnly(bottom: Dimens.ten),
        widget.textField,
      ],
    );
  }
}
