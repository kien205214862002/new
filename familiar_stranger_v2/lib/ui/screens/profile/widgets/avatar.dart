import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  VoidCallback onPressed;
  Avatar({
    Key? key,
    required this.size,
    required this.onPressed
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160 * size.height / 896,
      width: 160 * size.height / 896,
      decoration: BoxDecoration(
          color: fieldColor,
          border: Border.all(color: fieldBorder, width: 2.5),
          borderRadius:
              const BorderRadius.all(Radius.circular(200.0))),
      child: GestureDetector(
        onTap: onPressed,
        // child: ,
      ),
    );
  }
}