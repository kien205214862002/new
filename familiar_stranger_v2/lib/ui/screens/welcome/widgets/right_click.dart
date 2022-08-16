import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/cupertino.dart';


// ignore: must_be_immutable
class RightClick extends StatelessWidget {
  String title;
  VoidCallback press;
  RightClick({Key? key, required this.title, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 72*size.height/896,
        width: 186*size.width/414,
        decoration: BoxDecoration(
          color: secondaryText,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(10.0), bottomRight: Radius.circular(20.0)),
          border: Border.all(width: 3, color: fieldBorder),
        ),
        child: Text(title, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 20, color: primaryText ),
      ),
      )
    );
  }
}