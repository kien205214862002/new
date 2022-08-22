import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Clickitem extends StatefulWidget {
  String title;
  String subtitle;
  VoidCallback onPress;
  Clickitem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPress,
  }) : super(key: key);

  @override
  State<Clickitem> createState() => _ClickitemState();
}

class _ClickitemState extends State<Clickitem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: secondaryColor),
          ),
          subtitle: Text(
            widget.subtitle,
            style: const TextStyle(fontSize: 13, color: primaryText),
          ),
          trailing: Image.asset(
            'assets/icons/LeftArrow.png',
            scale: 3,
          ),
          onTap: widget.onPress,
        ),
        SizedBox(
          height: 5 * size.height / 896,
        ),
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
