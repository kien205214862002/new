import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButtonLong extends StatelessWidget {
  Color borderColor;
  Color backgroundColor;
  Color textColor;
  String text;
  VoidCallback press;
  RoundButtonLong(
      {Key? key,
      required this.borderColor,
      required this.backgroundColor,
      required this.textColor,
      required this.text, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 40 * size.width / 414, vertical: 7 * size.height / 896),
        decoration: BoxDecoration(
          color: backgroundColor,
            border: Border.all(color: borderColor, width: 3),
            borderRadius:
                const BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(0, 5), // changes position of shadow
        ),
      ],
                ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 17 * size.height / 896,
              color: textColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
