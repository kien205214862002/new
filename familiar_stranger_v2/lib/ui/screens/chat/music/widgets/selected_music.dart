import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectedMusic extends StatefulWidget {
  int index;
  String name;
  VoidCallback press;
  bool isPlay;
  SelectedMusic({Key? key, required this.index, required this.name, required this.press, required this.isPlay}) : super(key: key);

  @override
  State<SelectedMusic> createState() => _SelectedMusicState();
}

class _SelectedMusicState extends State<SelectedMusic> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 265*size.width/896,
      child: Column(
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
                child: (widget.isPlay == false)? Image.asset('assets/icons/Play_music.png', scale: 5.5,) : Image.asset('assets/icons/Pause_music.png', scale: 5.5,),
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