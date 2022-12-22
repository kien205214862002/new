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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

showSnackbar(title, message, IconData icon) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(icon, color: Colors.white));
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController authController = Get.put(AuthController());

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRetypeController = TextEditingController();
  bool remember = false;
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
            PhoneField(
              controller: phoneController,
              hint: 'PhoneNumber',
            ),
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
            PasswordField(
              controller: passwordRetypeController,
              hint: 'Retype password',
              press: () {},
            ),
            SizedBox(
              height: 23 * size.height / 896,
            ),
            CircleButton(
                press: () async {
                  ////uncommand this to use function
                  if(phoneController.text.isEmpty || passwordController.text.isEmpty|| passwordRetypeController.text.isEmpty){
                    showSnackbar('Sign Up fail','Missing phoneNumber and/or password',Icons.error);
                    return ;
                  }
                  if(passwordController.text != passwordRetypeController.text) {
                    showSnackbar('Sign Up fail','Password don\'t match',Icons.error);
                    return;
                  }
                  var result = await authController.signUp(phoneController.text, passwordController.text);
                  result ? {
                    Get.back(result: {"phoneNumber":phoneController.text, "password":passwordController.text}),
                    showSnackbar('Sign Up Success','Login pls',Icons.check)}
                    :showSnackbar('Sign Up fail','User exists',Icons.error);
                  //Get.toNamed('/beforLoginScreen');
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
                          Get.offNamed('/forgotScreen');
                        }),
                    RightClick(
                        title: 'LOG IN',
                        press: () {
                          Get.back();
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
