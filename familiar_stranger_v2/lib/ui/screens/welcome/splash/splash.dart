import 'package:familiar_stranger_v2/controllers/setting/setting_controller.dart';
import 'package:familiar_stranger_v2/controllers/user/authController.dart';
import 'package:familiar_stranger_v2/controllers/user/userController.dart';
import 'package:familiar_stranger_v2/services/socketio.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/welcome_bg.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthController authController = Get.put(AuthController());
  //fix bug
  SettingController settingController = Get.put(SettingController());
  UserController userController = Get.put(UserController());

  final userData = GetStorage();

  Future<void> checkIfLogged() async {
    if (userData.read('isLogged')) {
      var result = await authController.loginByToken();
      result?{
        Get.offNamed('/mainScreen')
      }:{
        userData.write('isLogged', false),
        userData.remove('token'),
        Get.offNamed('/loginScreen')
      };
    }else{
      Get.offNamed('/loginScreen');
    }
  }

  bool opening = false;
  @override
  void initState(){
    connectSocket();
    //userData.write('isLogged', false);
    userData.writeIfNull('isLogged', false);

    Future.delayed(const Duration(seconds: 1), (){
      setState(() {
        opening = true; 
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: WelcomeBG(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 4),
              scale: opening ? 1.0 : 0.0,
              onEnd: (){
                Future.delayed(const Duration(seconds: 2), (){
                  checkIfLogged();
                });
              },
              child: SizedBox(
                height: 150*size.height/896,
                width: 200*size.width/414,
                child: Image.asset('assets/images/Logo.png', fit: BoxFit.fill,)),
            ),
          ],
        ),
      ),
    );
  }
}
