import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RememberMe extends StatefulWidget {
  bool isSelected;
  VoidCallback press;
  RememberMe({Key? key, required this.isSelected, required this.press})
      : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: widget.press,
            child: Container(
              height: size.width*0.038,
              width: size.width*0.038,
              decoration: BoxDecoration(
                color: widget.isSelected ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: fieldBorder, width: 2)
              ),
            ),
          ),
          SizedBox(width: 11*size.width/414),
          const Text('Remember me', style: TextStyle(color: primaryText, fontFamily: 'Poppins', fontSize: 13),)
        ],
    );
  }
}
