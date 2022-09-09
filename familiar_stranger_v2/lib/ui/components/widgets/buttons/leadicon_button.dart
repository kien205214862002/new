import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconButtonModel extends StatelessWidget {
  String content;
  String imgLink;
  Color color;
  VoidCallback onPressed;
  IconButtonModel({Key? key, required this.content, required this.imgLink, required this.color,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 35*size.height/896,
      width: 145*size.width/414,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgLink, scale: 3,),
          SizedBox(width: 15*size.width/414,),
          Text(content, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 20,decoration: TextDecoration.underline,),)
        ],
      ),
    );
  }
}