import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/models/message.dart' as messagemodel;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message extends StatelessWidget {
  Message({
    Key? key,
    required this.mess,
    required this.isYour,
  }) : super(key: key);

  final messagemodel.Message mess;
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
          mainAxisAlignment: (isYour == false)
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            (isYour == false)
                ? Container(
                    height: 50 * size.height / 896,
                    width: 50 * size.height / 896,
                    decoration: BoxDecoration(
                        color: secondaryText,
                        border: Border.all(color: fieldBorder, width: 2.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(200.0))),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          mess.avatarURl ?? "https://i.imgur.com/n3nKtWa.jpg"),
                      radius: 30.0,
                    ),
                  )
                : Container(),
            (isYour == false)
                ? SizedBox(
                    width: 10,
                  )
                : Container(),
            Container(
                padding: const EdgeInsets.all(10.0),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                decoration: BoxDecoration(
                  color: (isYour == false) ? secondaryText : secondaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: (mess.isImage == false)
                    ? Text(
                        mess.content.toString(),
                        style: TextStyle(
                            color: (isYour == false)
                                ? primaryText
                                : secondaryText),
                      )
                    : GestureDetector(
                        onTap: () {
                          final data = {'imageLink': mess.content!};
                          Get.toNamed('/image', parameters: data);
                        },
                        child: Image.asset('assets/images/Vector.png',
                            scale: 10))),
            (isYour == true)
                ? SizedBox(
                    width: 10,
                  )
                : Container(),
            (isYour == true)
                ? Container(
                    height: 50 * size.height / 896,
                    width: 50 * size.height / 896,
                    decoration: BoxDecoration(
                        color: secondaryText,
                        border: Border.all(color: fieldBorder, width: 2.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(200.0))),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          mess.avatarURl ?? "https://i.imgur.com/n3nKtWa.jpg"),
                      radius: 30.0,
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
