import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessagageBar extends StatefulWidget {
  TextEditingController controller;
  VoidCallback pressRecord;
  VoidCallback pressEmoji;
  VoidCallback pressImage;
  VoidCallback sendMessage;
  MessagageBar(
      {Key? key,
      required this.controller,
      required this.pressRecord,
      required this.pressEmoji,
      required this.pressImage,
      required this.sendMessage})
      : super(key: key);

  @override
  State<MessagageBar> createState() => _MessagageBarState();
}

class _MessagageBarState extends State<MessagageBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 65 * size.height / 896,
      decoration: BoxDecoration(
        color: secondaryText,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        border: Border.all(color: secondaryColor, width: 3.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: widget.pressRecord,
            child: Image.asset(
              'assets/icons/Add Record.png',
              scale: 4,
            ),
          ),
          GestureDetector(
            onTap: widget.pressEmoji,
            child: Image.asset(
              'assets/icons/Sleeping.png',
              scale: 4,
            ),
          ),
          GestureDetector(
            onTap: widget.pressImage,
            child: Image.asset(
              'assets/icons/Image.png',
              scale: 4,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0 * size.height / 896),
            height: 55 * size.height / 896,
            width: 260 * size.width / 414,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(18.0),
              border: Border.all(color: secondaryColor, width: 2),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              maxLines: 1,
              style: const TextStyle(color: primaryText, fontSize: 16),
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type message here...',
                isCollapsed: true,
                hintStyle: const TextStyle(color: fieldBG, fontSize: 16),
                suffixIcon: GestureDetector(
                  onTap: widget.sendMessage,
                  child: Image.asset(
                    'assets/icons/EmailSend.png',
                    scale: 4,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
