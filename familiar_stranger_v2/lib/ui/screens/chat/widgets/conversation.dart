import 'package:familiar_stranger_v2/controllers/conversationController.dart';
import 'package:familiar_stranger_v2/controllers/user/userController.dart';
import 'package:familiar_stranger_v2/ui/screens/chat/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Conversation extends StatefulWidget {
  Conversation({Key? key}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  ConversationController conversationController =
      Get.put(ConversationController());
  UserController userController = Get.put(UserController());
  bool isYour = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0 * size.width / 414),
      height: (896 - 50 - 75 - 100) * size.height / 896,
      width: double.infinity,
      child: Obx(
        () => ListView.builder(
          // reverse: true,

          itemCount: conversationController.listMessage.length,
          itemBuilder: (BuildContext context, int index) {
            if (userController.currentUser.value.id ==
                conversationController.listMessage.elementAt(index).senderId) {
              isYour = true;
            } else {
              isYour = false;
            }
            return Message(
              mess: conversationController.listMessage.elementAt(index),
              isYour: isYour,
            );
          },
        ),
      ),
    );
  }
}
