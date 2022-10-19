import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/myController.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/avatar.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/image_show.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/intro_container.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/wallpaper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  MyController myController = Get.put(MyController());

  bool isIntro = true;

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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
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
                  color: primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed('/editProfileScreen');
                  },
                  child: Image.asset(
                    'assets/icons/Edit Mailbox.png',
                    scale: 3.5,
                  )),
            ],
          ),
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
                        // const WallPaper(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => Avatar(
                                size: size,
                                url: myController.currentUser.value.listImage![0].imageUrl.toString(),
                                onPressed: () {
                                  myController.upAvatar();
                                },
                            ),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 40 * size.height / 896),
                                Obx(
                                  () => Text(
                                    myController.currentUser.value.username.toString(),
                                    style: const TextStyle(
                                        color: primaryText,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 23),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    myController.currentUser.value.emotion.toString(),
                                    style: const TextStyle(
                                        color: primaryText, fontSize: 14),
                                  ),
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
                          child: Obx(() => isIntro == false
                                ? Stack(children: [
                                    Positioned.fill(child: ImageShow(
                                      onChanged: (value) {
                                        //get the current image position in list
                                      },
                                    )),
                                    Positioned.fill(
                                        child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 123 * size.height / 896,
                                          width: size.width * 0.891,
                                          color: fieldBorder.withOpacity(0.4),
                                          child: const Text(
                                            'Data',
                                            style: TextStyle(
                                                color: secondaryText,
                                                fontSize: 18),
                                          ),
                                        )
                                      ],
                                    )),
                                  ])
                                : IntroContainer(
                                    name: myController.currentUser.value.username.toString(),
                                    birth: int.parse(
                                        myController.currentUser.value.yearOfB.toString()),
                                    genderLink: myController.currentUser.value.sex.toString() == 'male'
                                    ? 'assets/icons/Call.png'
                                    : 'assets/icons/Call-1.png',
                                    description: myController.currentUser.value.description.toString(),
                                    status:
                                        '........................................................................',
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 270 * size.height / 896,
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
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/Add.png',
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
