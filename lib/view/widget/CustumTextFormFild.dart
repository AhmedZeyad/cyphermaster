import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/consetvar.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;

  final String labelText;

  final IconData iconData;
  final bool hidetext;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;

  final void Function(String val) onChanged;

  CustomTextFormField(
      {required this.controller,
      required this.hintText,
      required this.labelText,
      required this.iconData,
      required this.onChanged,
      this.hidetext = false,
      this.readOnly = false,
      this.maxLength,
      this.maxLines,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.26,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: TextFormField(
        inputFormatters: [
          if (keyboardType == TextInputType.number ||
              keyboardType == TextInputType.datetime)
            FilteringTextInputFormatter.allow(RegExp('[0-9,-]'))
        ],cursorColor: primary,
        readOnly: readOnly,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLength: maxLength,
        obscureText: hidetext,
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: text),
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,

          fillColor: Colors.black,
          focusColor: Colors.black,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: text_body),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        maxLines: maxLines,
      ),
    );
  }
}
