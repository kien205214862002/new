import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MultilineTextField extends StatelessWidget {
  ValueChanged onChanged;
  TextEditingController controller;
  String hint;
  MultilineTextField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.hint
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      height: 180*size.height/896,
      width: 320*size.width/369,
      decoration: BoxDecoration(
        color: secondaryText,
        border: Border.all(color: fieldBorder, width: 2.5),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            maxLines: 5,
            controller: controller,
            textAlign: TextAlign.center,
            onChanged: onChanged,
            style: const TextStyle(color: primaryText, fontSize: 15, fontWeight: FontWeight.normal),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: primaryText.withOpacity(0.5), fontSize: 15, fontWeight: FontWeight.normal),
              isCollapsed: true,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}