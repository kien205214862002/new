import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogCalling extends StatefulWidget {
  String title;
  VoidCallback accept;
  VoidCallback reject;
  DialogCalling(
      {Key? key,
      required this.title,
      required this.accept,
      required this.reject})
      : super(key: key);

  @override
  State<DialogCalling> createState() => _DialogCallingState();
}

class _DialogCallingState extends State<DialogCalling> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 1,
      backgroundColor: fieldBorder.withOpacity(0.3),
      child: Container(
        height: 160 * size.height / 896,
        width: 275 * size.width / 414,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: fieldColor,
            border: Border.all(color: fieldBorder, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: widget.accept,
                  icon: Image.asset(
                    'assets/icons/Phone.png',
                  ),
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: widget.reject,
                  icon: Image.asset(
                    'assets/icons/Missed Call.png',
                  ),
                  iconSize: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
