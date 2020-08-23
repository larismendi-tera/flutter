import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class TextInput extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final TextEditingController controller;
  final int maxLine;

  TextInput(
      {Key key,
      @required this.label,
      @required this.inputType,
      @required this.controller,
      this.maxLine});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: kDefaultPadding, left: kDefaultPadding),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLine,
        style: TextStyle(
            color: kPrimaryColor, fontSize: 15.0, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            filled: true,
            fillColor: kBackgroudAltColor,
            border: InputBorder.none,
            hintText: label,
            labelText: label,
            labelStyle: TextStyle(color: kPrimaryColor.withAlpha(150)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
