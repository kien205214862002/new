import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/user/authController.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/welcome_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/circle_button.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/left_click.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/password_textfield.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/phone_textfield.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/right_click.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeforeLoginScreen extends StatefulWidget {
  const BeforeLoginScreen({Key? key}) : super(key: key);

  @override
  State<BeforeLoginScreen> createState() => _BeforeLoginScreenState();
}

showSnackbar(title, message, IconData icon) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(icon, color: Colors.white));
}

class _BeforeLoginScreenState extends State<BeforeLoginScreen> {
  AuthController authController = Get.put(AuthController());

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  bool remember = false;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: WelcomeBG(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150 * size.height / 896,
            ),
            Text(
              'Before your Login',
              style: TextStyle(
                  color: primaryText,
                  fontFamily: 'NewRocker',
                  fontSize: 40 * size.height / 896),
            ),
            SizedBox(
              height: 130 * size.height / 896,
            ),
            Text(
              'Type your information',
              style: TextStyle(
                  color: primaryText, fontSize: 25 * size.height / 896),
            ),
            SizedBox(
              height: 53 * size.height / 896,
            ),
            PhoneField(
              controller: emailController,
              hint: 'Email',
            ),
            SizedBox(
              height: 23 * size.height / 896,
            ),
            PhoneField(
              controller: emailController,
              hint: 'Username',
            ),
            SizedBox(
              height: 23 * size.height / 896,
            ),
            PhoneField(
              controller: emailController,
              hint: 'Age',
            ),
            SizedBox(
              height: 40 * size.height / 896,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (isMale == false) {
                      showSnackbar(
                          "Gender Selection", "Choose 'MALE'", Icons.male);
                      setState(() {
                        isMale = true;
                      });
                    }
                  },
                  child: Image.asset(
                    'assets/icons/Male.png',
                    scale: 3,
                  ),
                ),
                SizedBox(
                  width: 60 * size.width / 414,
                ),
                GestureDetector(
                  onTap: () {
                    if (isMale == true) {
                      showSnackbar(
                          "Gender Selection", "Choose 'FEMALE'", Icons.female);
                      setState(() {
                        isMale = false;
                      });
                    }
                  },
                  child: Image.asset(
                    'assets/icons/Female.png',
                    scale: 3,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 23 * size.height / 896,
            ),
            CircleButton(
                press: () async {
                  if (emailController.text.isEmpty ||
                      usernameController.text.isEmpty ||
                      ageController.text.isEmpty) {
                    showSnackbar('You must fill your information before login!',
                        'Missing email/username or age', Icons.error);
                    return;
                  }
                },
                title: 'GO'),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // LeftClick(
                    //     title: '  FORGOT',
                    //     press: () {
                    //       Get.offNamed('/forgotScreen');
                    //     }),
                    // RightClick(
                    //     title: 'LOG IN',
                    //     press: () {
                    //       Get.back();
                    //     })
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
