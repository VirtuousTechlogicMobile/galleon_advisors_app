import 'package:flutter/material.dart';
import 'package:galleon_advisors_app/constant/colors.dart';

import '../../../constant/dimens.dart';

class ExpandableView extends StatefulWidget {
  @override
  _ExpandableViewState createState() => _ExpandableViewState();
}

class _ExpandableViewState extends State<ExpandableView> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        collapsedBackgroundColor: ColorValues.whiteColor,
        backgroundColor: ColorValues.whiteColor,
        collapsedShape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimens.ten,
          ),
        ),

        title: const Row(
          children: [
            Text(
              "Food & Beverage - Barista",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 5,
            )
          ],
        ),
        trailing: Icon(Icons.arrow_drop_down),

        // This applies the shape and border radius directly to ExpansionTile
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          side: BorderSide(color: Colors.grey), // Border color
        ),

        children: [
          CheckboxListTile(
            title: Text("Select All"),
            value: isChecked1 && isChecked2,
            onChanged: (bool? value) {
              setState(() {
                isChecked1 = value!;
                isChecked2 = value;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Study Name"),
            value: isChecked1,
            onChanged: (bool? value) {
              setState(() {
                isChecked1 = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
          ),
          CheckboxListTile(
            title: Text("Test"),
            value: isChecked2,
            onChanged: (bool? value) {
              setState(() {
                isChecked2 = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
          ),
        ],
      ),
    );
  }
}
