import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/user/notificationController.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/leadIcon_button.dart';
import 'package:familiar_stranger_v2/ui/screens/notification/widgets/type_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Notification',
          style: TextStyle(
              color: primaryText, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            'assets/icons/Back_black.png',
            scale: 3.0,
          ),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: HomeBG(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 700 * size.height / 896,
                    width: 369 * size.width / 414,
                    decoration: BoxDecoration(
                        color: secondaryText,
                        border: Border.all(color: fieldBorder, width: 4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15 * size.height / 896),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButtonModel(
                                content: 'Read All',
                                imgLink: 'assets/icons/Chat Message Sent.png',
                                color: Color(0xFF78a55a),
                                onPressed: () {}),
                            SizedBox(
                              width: 30 * size.width / 414,
                            ),
                            IconButtonModel(
                                content: 'Read All',
                                imgLink: 'assets/icons/Delete Message.png',
                                color: Color(0xFFbb271a),
                                onPressed: () {
                                  print('object');
                                }),
                          ],
                        ),
                        const Divider(
                          thickness: 4,
                          color: fieldBorder,
                        ),
                        SizedBox(height: 15 * size.height / 896),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 570 * size.height / 896,
                          width: 369 * size.width / 414,
                          alignment: Alignment.topCenter,
                          child: Obx(
                            () => ListView.builder(
                              //reverse: true,
                              itemCount: notificationController
                                  .listNotification.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TypeNotification(
                                    type: notificationController
                                        .listNotification
                                        .elementAt(index)
                                        .type,
                                    content: notificationController
                                        .listNotification
                                        .elementAt(index)
                                        .content,
                                    accept: (_) {
                                      (notificationController.listNotification.elementAt(index).type == "InviteToRoom")
                                      ? notificationController.acceptInviteToRoom(
                                            notificationController
                                                .listNotification
                                                .elementAt(index)
                                                .senderId)
                                      : notificationController.acceptInviteToAddFriend(
                                            notificationController
                                                .listNotification
                                                .elementAt(index)
                                                .senderId);
                                    },
                                    reject: (_) {});
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
