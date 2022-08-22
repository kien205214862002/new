import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwitchItem extends StatefulWidget {
  String title;
  String subtitle;
  bool isActive;
  ValueChanged onChanged;
  SwitchItem({Key? key, required this.title, required this.subtitle, required this.isActive, required this.onChanged, }) : super(key: key);

  @override
  State<SwitchItem> createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SwitchListTile(
                    title: Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryColor),),
                    subtitle: Text(widget.subtitle, style: const TextStyle(fontSize: 13, color: primaryText),),
                    activeColor: thirdColor,
                    value: widget.isActive, 
                    onChanged: widget.onChanged,
                    // onChanged: (value){
                    //   setState(() {
                    //     widget.isActive = !widget.isActive;
                    //   });}
                    ),
                  SizedBox(height: 5*size.height/896,),
                  const Divider(
                    indent: 15,
                    endIndent: 40,
                    thickness: 2,
                    color: fieldBorder,
                  ),
      ],
    );
  }
}