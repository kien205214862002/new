import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OptionMusic extends StatefulWidget {
  int index;
  String name;
  VoidCallback press;
  bool isSelected;
  OptionMusic({Key? key, required this.index, required this.name, required this.press, required this.isSelected}) : super(key: key);

  @override
  State<OptionMusic> createState() => _OptionMusicState();
}

class _OptionMusicState extends State<OptionMusic> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 265*size.width/896,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(widget.index.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  SizedBox(width: 20*size.width/414),
                  Text(widget.name, style: const TextStyle( fontSize: 15),),
                ],
              ),
              GestureDetector(
                onTap: widget.press,
                child: (widget.isSelected == true)? Image.asset('assets/icons/Checked Checkbox.png', scale: 3,) : Image.asset('assets/icons/Unchecked Checkbox.png', scale: 3,),
              ),
            ],
          ),
          SizedBox(height: 5*size.height/896,),
          Divider(
            indent: size.width*0.1,
            endIndent: size.width*0.1,
            thickness: 2,
            color: fieldBorder,
          ),
        ],
      ),
    );
  }
}