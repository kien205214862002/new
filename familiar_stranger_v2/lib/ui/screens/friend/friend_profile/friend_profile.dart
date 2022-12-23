import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/user/authController.dart';
import 'package:familiar_stranger_v2/controllers/user/notificationController.dart';
import 'package:familiar_stranger_v2/models/user.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:familiar_stranger_v2/ui/screens/open_image/image.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/avatar.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/image_show.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/intro_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendProfileScreen extends StatefulWidget {
  FriendProfileScreen({Key? key, required this.friendAcc}) : super(key: key);
  Rx<User> friendAcc;
  @override
  State<FriendProfileScreen> createState() => _FriendProfileScreenState();
}

showSnackbar(title, message, IconData icon) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(icon, color: Colors.white));
}

class _FriendProfileScreenState extends State<FriendProfileScreen> {
  bool isIntro = true;
  NotificationController notificationController =
      Get.put(NotificationController());
  void changeButton() {
    setState(() {
      isIntro = !isIntro;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3.0),
            child: Container(
              color: primaryText,
              height: 1.5,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Profile',
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
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  Get.toNamed('/reportScreen');
                },
                child: Image.asset(
                  'assets/icons/Error-1.png',
                  scale: 3.5,
                )),
          ],
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: HomeBG(
              child: Column(
                children: [
                  SizedBox(
                    height: 270 * size.height / 896,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Avatar(
                              size: size,
                              url: widget.friendAcc.value.listImage![0].imageUrl
                                  .toString(),
                              onPressed: () {
                                final data = {
                                  'imageLink': widget
                                      .friendAcc.value.listImage![0].imageUrl
                                      .toString(),
                                };
                                Get.toNamed('/image', parameters: data);
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 40 * size.height / 896),
                                Text(
                                  widget.friendAcc.value.username.toString(),
                                  style: const TextStyle(
                                      color: primaryText,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 23),
                                ),
                                Text(
                                  widget.friendAcc.value.description.toString(),
                                  style: const TextStyle(
                                      color: primaryText, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              borderColor:
                                  isIntro ? fieldColor : secondaryColor,
                              backgroundColor:
                                  isIntro ? secondaryColor : fieldColor,
                              textColor: isIntro ? secondaryText : primaryText,
                              text: 'Intro',
                              press: () {
                                if (isIntro == false) {
                                  changeButton();
                                }
                              },
                            ),
                            SizedBox(width: 7 * size.width / 414),
                            RoundButton(
                              borderColor:
                                  isIntro ? secondaryColor : fieldColor,
                              backgroundColor:
                                  isIntro ? fieldColor : secondaryColor,
                              textColor: isIntro ? primaryText : secondaryText,
                              text: 'Images',
                              press: () {
                                if (isIntro == true) {
                                  changeButton();
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 21 * size.height / 896),
                        Container(
                          alignment: Alignment.center,
                          height: 550 * size.height / 896,
                          width: size.width * 0.891,
                          decoration: BoxDecoration(
                              color: secondaryText,
                              border:
                                  Border.all(color: fieldBorder, width: 2.5),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0))),
                          child: isIntro == false
                              ? Stack(children: [
                                  Positioned.fill(
                                      child: ImageShow(
                                    list: widget.friendAcc.value.listImage!,
                                    onChanged: (value) {
                                      //get the current image position in list
                                    },
                                  )),
                                  // Positioned.fill(
                                  //     child: Column(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: [
                                  //     Container(
                                  //       alignment: Alignment.center,
                                  //       height: 123 * size.height / 896,
                                  //       width: size.width * 0.891,
                                  //       color: fieldBorder.withOpacity(0.4),
                                  //       child: const Text(
                                  //         'Data Friend',
                                  //         style: TextStyle(
                                  //             color: secondaryText,
                                  //             fontSize: 18),
                                  //       ),
                                  //     )
                                  //   ],
                                  // ))
                                ])
                              : IntroContainer(
                                  name: widget.friendAcc.value.username
                                      .toString(),
                                  birth: int.parse(widget
                                      .friendAcc.value.yearOfB
                                      .toString()),
                                  genderLink:
                                      widget.friendAcc.value.sex.toString() ==
                                              'male'
                                          ? 'assets/icons/Male.png'
                                          : 'assets/icons/Female.png',
                                  description: widget
                                      .friendAcc.value.description
                                      .toString(),
                                  status: widget.friendAcc.value.emotion
                                      .toString()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 150 * size.height / 896,
            right: 0,
            child: Container(
              width: 63 * size.width / 414,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: secondaryColor, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              child: Column(
                children: [
                  SizedBox(
                    height: 10 * size.height / 896,
                  ),
                  GestureDetector(
                    onTap: () {
                      if(!userController.currentListFriend.any((element) => element.value.id == widget.friendAcc.value.id)){
                        notificationController.sendInviteToAddFriend(widget.friendAcc.value.id);
                        showSnackbar('Send invite to add friend', 'Send invite to add friend successful', Icons.check);
                      } else {
                        showSnackbar('Send invite to add friend', 'We are friend together', Icons.check);
                      }
                    },
                    child: Image.asset(
                      'assets/icons/Following-1.png',
                      scale: 4,
                    ),
                  ),
                  SizedBox(
                    height: 20 * size.height / 896,
                  ),
                  GestureDetector(
                    onTap: () {
                      notificationController
                          .sendInviteToRoom(widget.friendAcc.value.id);
                      showSnackbar('Send invite to chatroom',
                          'Please, watting for response', Icons.check);
                    },
                    child: Image.asset(
                      'assets/icons/Chat-1.png',
                      scale: 4,
                    ),
                  ),
                  SizedBox(
                    height: 20 * size.height / 896,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/Delete-1.png',
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
        ]),
      ),
    );
  }
}
