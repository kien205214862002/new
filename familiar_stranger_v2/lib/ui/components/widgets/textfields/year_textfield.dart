import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YearTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  YearTextField({Key? key, required this.controller, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.center,
      height: 60 * size.height / 896,
      width: 156 * size.width / 414,
      decoration: BoxDecoration(
          color: secondaryText,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: primaryText,
            width: 2,
          )),
      child: TextField(
        textAlign: TextAlign.center,
        maxLines: 1,
        controller: controller,
        style: const TextStyle(
            fontSize: 18, color: primaryText, fontFamily: 'Poppins'),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: primaryText.withOpacity(0.5)),
          isCollapsed: true,
        ),
      ),
    );
  }
}
