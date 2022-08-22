import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.isImage,
    required this.isYour,
  }) : super(key: key);

  final bool isImage;
  final bool isYour;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 10 * size.height / 896,
        ),
        Row(
          mainAxisAlignment:
              (isYour == false) ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
                padding: const EdgeInsets.all(10.0),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                decoration: BoxDecoration(
                  color: (isYour == false) ? secondaryText : secondaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: (isImage == false)
                    ? Text(
                        'Chatchit',
                        style: TextStyle(
                            color: (isYour == false) ? primaryText : secondaryText),
                      )
                    : Image.asset('assets/images/Vector.png', scale: 10)),
          ],
        ),
      ],
    );
  }
}
