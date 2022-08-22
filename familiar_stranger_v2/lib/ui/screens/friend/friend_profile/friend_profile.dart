import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/avatar.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/image_show.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/intro_container.dart';
import 'package:flutter/material.dart';

class FriendProfileScreen extends StatefulWidget {
  const FriendProfileScreen({Key? key}) : super(key: key);

  @override
  State<FriendProfileScreen> createState() => _FriendProfileScreenState();
}

class _FriendProfileScreenState extends State<FriendProfileScreen> {
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
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {},
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
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          height: 160 * size.height / 896,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: fieldColor,
                              border:
                                  Border.all(color: fieldBorder, width: 2.5),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(45.0))),
                          //WallPaper
                          // child: ,
                        ),
                        Positioned(
                          top: 80 * size.height / 896,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Avatar(
                                size: size,
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 15 * size.width / 414,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 70 * size.height / 896),
                                  const Text(
                                    'Name',
                                    style: TextStyle(
                                        color: primaryText,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 23),
                                  ),
                                  const Text(
                                    'Short Description',
                                    style: TextStyle(
                                        color: primaryText, fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                  Positioned.fill(child: ImageShow(onChanged: (value){
                                    //get the current image position in list
                                  },)),
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
                                          'Data Friend',
                                          style: TextStyle(
                                              color: secondaryText,
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ))
                                ])
                              : IntroContainer(
                                name: 'Tran Thanh Trung',
                                birth: 2001,
                                genderLink: 'assets/icons/Call.png',
                                description: '................................................................',
                                status: '........................................................................',
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
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/Following-1.png',
                      scale: 4,
                    ),
                  ),
                  SizedBox(
                    height: 20 * size.height / 896,
                  ),
                  GestureDetector(
                    onTap: () {},
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
