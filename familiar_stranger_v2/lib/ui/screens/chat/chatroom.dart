import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/conversationController.dart';
import 'package:familiar_stranger_v2/controllers/user/userController.dart';
import 'package:familiar_stranger_v2/services/socketio.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/chatroom_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/chat/widgets/conversation.dart';
import 'package:familiar_stranger_v2/ui/screens/chat/widgets/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

showSnackbar(title, message, IconData icon) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(icon, color: Colors.white));
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  UserController userController = Get.put(UserController());
  ConversationController conversationController =
      Get.put(ConversationController());

  TextEditingController messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3.0),
              child: Container(
                color: primaryText,
                width: 220 * size.width / 414,
                height: 1.5,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'ChatRoom',
              style: TextStyle(
                  color: primaryText,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  conversationController.getOutConversation();
                },
                icon: Image.asset(
                  'assets/icons/Back_black.png',
                  scale: 1 * size.width / 414,
                )),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 5.0 * size.width / 414),
                child: GestureDetector(
                    onTap: () {
                      if (!userController.currentListFriend.any((element) =>
                          element.value.id ==
                          conversationController.targetUser.value.id)) {
                        notificationController.sendInviteToAddFriend(
                            conversationController.targetUser.value.id);
                        showSnackbar(
                            'Send invite to add friend',
                            'Send invite to add friend successful',
                            Icons.check);
                      } else {
                        showSnackbar('Send invite to add friend',
                            'We are friend together', Icons.check);
                      }
                    },
                    child: Image.asset(
                      'assets/icons/Following.png',
                      scale: 3.5,
                    )),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: ChatRoomBG(
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Conversation()),
                          MessagageBar(
                              controller: messageTextController,
                              pressRecord: () {},
                              pressEmoji: () {},
                              pressImage: () {
                                conversationController.sendImageMessage(
                                    userController.currentUser.value.id,
                                    userController.currentUser.value
                                        .listImage![0].imageUrl);
                              },
                              sendMessage: () {
                                conversationController.sendMessage(
                                    userController.currentUser.value.id,
                                    userController.currentUser.value
                                        .listImage![0].imageUrl,
                                    messageTextController.text.toString());
                                print('send message');
                                messageTextController.clear();
                              })
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 150 * size.height / 896,
              right: 0,
              child: Container(
                width: 63 * size.width / 414,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    border: Border.all(color: secondaryColor, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10 * size.height / 896,
                    ),
                    GestureDetector(
                      onTap: () {
                        final data = {
                          "chatroom":
                              "${userController.currentUser.value.id.toString()}_voice",
                          "avt": conversationController
                              .targetUser.value.listImage![0].imageUrl
                              .toString(),
                          "type": "voice"
                        };
                        voiceCall(data);
                        Get.toNamed('/voice_calling', parameters: data);
                      },
                      child: Image.asset(
                        'assets/icons/Call-1.png',
                        scale: 4,
                      ),
                    ),
                    SizedBox(
                      height: 20 * size.height / 896,
                    ),
                    GestureDetector(
                      onTap: () {
                        final data = {
                          "chatroom":
                              "${userController.currentUser.value.id.toString()}_video1",
                          "avt": conversationController
                              .targetUser.value.listImage![0].imageUrl
                              .toString(),
                          "type": "video"
                        };
                        voiceCall(data);
                        Get.toNamed('/video_calling', parameters: data);
                      },
                      child: Image.asset(
                        'assets/icons/Video Call-1.png',
                        scale: 4,
                      ),
                    ),
                    SizedBox(
                      height: 20 * size.height / 896,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/musicScreen');
                      },
                      child: Image.asset(
                        'assets/icons/MusicHeart-1.png',
                        scale: 4,
                      ),
                    ),
                    SizedBox(
                      height: 20 * size.height / 896,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/reportScreen');
                      },
                      child: Image.asset(
                        'assets/icons/Error-1.png',
                        scale: 4,
                      ),
                    ),
                    SizedBox(
                      height: 10 * size.height / 896,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
