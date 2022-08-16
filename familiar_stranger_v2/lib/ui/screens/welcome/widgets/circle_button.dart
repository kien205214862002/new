import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleButton extends StatelessWidget {
  VoidCallback press;
  String title;
  CircleButton({Key? key, required this.press, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 95*size.width/414,
      width: 95*size.width/414,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: thirdColor,
          side: const BorderSide(
            width: 3,
            color: secondaryText,
          ),
          shape: const CircleBorder(),
        ),
        onPressed: press, 
        child: Text(title, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 28, color: secondaryText ),),
        ),
    );
  }
}