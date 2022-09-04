import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/myController.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/welcome_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/circle_button.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/left_click.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/password_textfield.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/phone_textfield.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/remember.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/right_click.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

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

  MyController myController = Get.put(MyController());

  final userData = GetStorage();

  @override
  void initState() {
    super.initState();
    userData.writeIfNull('isLogged', false);
    Future.delayed(Duration.zero,()async{
      checkIfLogged();
    });
  }

  Future<void> checkIfLogged() async {
    if (userData.read('isLogged')) {
      var result = await getUser(userData.read('token'));
      result?{
        Get.offNamed('/mainScreen')
      }:{
        userData.write('isLogged', false),
        userData.remove('token')
      };
    }
  }

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
            PhoneField(controller: phoneController),
            SizedBox(
              height: 23 * size.height / 896,
            ),
            PasswordField(
              controller: passwordController,
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
                    (await submitLogin(phoneController.text, passwordController.text))?{
                      userData.write('token', myController.currentUser.value.token),
                      userData.write('isLogged', true),
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
