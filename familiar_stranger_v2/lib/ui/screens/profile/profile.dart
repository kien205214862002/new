import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/avatar.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/image_show.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/widgets/intro_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isIntro = true;

  void changeButton(){
    setState(() {
      isIntro = !isIntro;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: HomeBG(
            child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 160 * size.height / 896,
                width: size.width,
                decoration: BoxDecoration(
                    color: fieldColor,
                    border: Border.all(color: fieldBorder, width: 2.5),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(45.0))),
                //WallPaper
                // child: ,
              ),
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
                      Text(
                        'Name',
                        style: TextStyle(
                            color: primaryText,
                            fontWeight: FontWeight.w800,
                            fontSize: 26),
                      ),
                      Text(
                        'Short Description',
                        style: TextStyle(color: primaryText, fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50 * size.width / 414,
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(height: 45 * size.height / 896),
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/Edit Mailbox.png',
                          scale: 3.5,
                        )),
                  ])
                ],
              ),
            ),
            Positioned(
                top: 240 * size.height / 896,
                child: Container(
                  padding: EdgeInsets.all(22 * size.width / 414),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RoundButton(
                            borderColor: isIntro? fieldColor : secondaryColor,
                            backgroundColor: isIntro? secondaryColor : fieldColor,
                            textColor: isIntro? secondaryText : primaryText,
                            text: 'Intro',
                            press: () {
                              if(isIntro == false)
                              {
                                changeButton();
                              }
                            },
                          ),
                          SizedBox(width: 7 * size.width / 414),
                          RoundButton(
                            borderColor: isIntro? secondaryColor : fieldColor ,
                            backgroundColor: isIntro? fieldColor : secondaryColor,
                            textColor: isIntro? primaryText : secondaryText,
                            text: 'Images',
                            press: () {
                              if(isIntro == true)
                              {
                                changeButton();
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 21 * size.height / 896),
                      Container(
                        height: 475 * size.height / 896,
                        width: size.width * 0.891,
                        decoration: BoxDecoration(
                            color: secondaryText,
                            border: Border.all(color: fieldBorder, width: 3.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                        child: isIntro == false ? ImageShow() :  IntroContainer() ,
                      )
                    ],
                  ),
                )),
          ],
        )));
  }
}


