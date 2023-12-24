// import 'package:cyphermaster/controler/OprationController.dart';
import 'package:cyphermaster/view/widget/CustomButtonstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

import '../../core/consetvar.dart';

class CustomDrobDone extends StatelessWidget {
  String? selectedValue = null;
  String value;
  final List<DropdownMenuItem<String>> items;
  void Function(String?) onChanged;
  CustomDrobDone({
    required this.value,
    required this.items,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {

    ;
    return CustomButtonStyle(

      child: DropdownButton<String>(

        hint: Text(
          value,
          style: TextStyle(fontSize: 14, color: primary_text),
        ),
        borderRadius: BorderRadius.circular(30),
        value: selectedValue,
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 15,
          color: Colors.black,
        ),
        onChanged:onChanged,
        items:items,
      ),
    );
  }
}
