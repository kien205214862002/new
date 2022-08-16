import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';

class WallPaper extends StatelessWidget {
  const WallPaper({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 160 * size.height / 896,
      width: size.width,
      decoration: BoxDecoration(
          color: secondaryText,
          border:
              Border.all(color: fieldBorder, width: 2.5),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(45.0))),
      //WallPaper
      // child: ,
    );
  }
}