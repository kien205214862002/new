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

class WaitingBeforeLoginScreen extends StatefulWidget {
  const WaitingBeforeLoginScreen({Key? key}) : super(key: key);

  @override
  State<WaitingBeforeLoginScreen> createState() =>
      _WaitingBeforeLoginScreenState();
}

showSnackbar(title, message, IconData icon) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(icon, color: Colors.white));
}

class _WaitingBeforeLoginScreenState extends State<WaitingBeforeLoginScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed('/beforLoginScreen');
    });
    super.initState();
  }

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
            SizedBox(
                height: 150 * size.height / 896,
                width: 200 * size.width / 414,
                child: Image.asset(
                  'assets/images/Logo.png',
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 23 * size.height / 896,
            ),
            Text(
              'Familiar Stranger',
              style: TextStyle(
                  color: primaryText,
                  fontFamily: 'NewRocker',
                  fontSize: 35 * size.height / 896),
            ),
            SizedBox(
              height: 53 * size.height / 896,
            ),
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/images/WaitingBefore.png',
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 15 * size.height / 896,
            ),
            Text(
              'Will be there soon...',
              style: TextStyle(
                  color: primaryText, fontSize: 30 * size.height / 896),
            ),
          ],
        ),
      ),
    );
  }
}
