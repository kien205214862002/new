import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/user/authController.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/welcome_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/circle_button.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/left_click.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/password_textfield.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/phone_textfield.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/remember.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/right_click.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

showSnackbar(title, message, IconData icon) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(icon, color: Colors.white));
}

class _LoginScreenState extends State<LoginScreen> {

  AuthController authController = Get.put(AuthController());

  bool checkIsEmpty(){
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      return true;
    }
    return false;
  }

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
            PhoneField(controller: phoneController,hint: 'PhoneNumber',),
            SizedBox(
              height: 23 * size.height / 896,
            ),
            PasswordField(
              controller: passwordController,
              hint: 'Password',
              press: () {},
            ),
            SizedBox(
              height: 23 * size.height / 896,
            ),
            RememberMe(isSelected: remember, press: () {}),
            SizedBox(
              height: 15 * size.height / 896,
            ),
            CircleButton(
                press: () async {
                  checkIsEmpty()?{
                    showSnackbar('Login fail', 'Missing phoneNumber and/or password', Icons.error)
                  }:{
                    (await authController.login(phoneController.text, passwordController.text))?{
                      Get.offNamed('/mainScreen')
                    }:{
                      showSnackbar('Login fail','Incorrect phoneNumber or password', Icons.error)
                    }
                  };
                },
                title: 'GO'),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LeftClick(
                        title: '  FORGOT',
                        press: () {
                          Get.toNamed('/forgotScreen');
                        }),
                    RightClick(
                        title: 'SIGN UP',
                        press: () async {
                          var result = await Get.toNamed('/signUpScreen');
                          if (result != null) {
                            phoneController.text = result["phoneNumber"];
                            passwordController.text = result["password"];
                          }
                        })
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
