import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MultiTextField extends StatelessWidget {
  ValueChanged onChanged;
  TextEditingController controller;
  MultiTextField({
    Key? key,
    required this.onChanged, 
    required this.controller
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(15),
      height: 189*size.height/896,
      width: 369*size.width/369,
      decoration: BoxDecoration(
        color: secondaryText,
        border: Border.all(color: fieldBorder, width: 2.5),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: TextField(
        maxLines: 5,
        controller: controller,
        textAlign: TextAlign.justify,
        onChanged: onChanged,
        style: const TextStyle(color: primaryText, fontSize: 15, fontWeight: FontWeight.normal),
        decoration: const InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}