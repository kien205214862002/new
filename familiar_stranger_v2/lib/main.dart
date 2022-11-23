import 'package:familiar_stranger_v2/config/themes/theme.dart';
import 'package:familiar_stranger_v2/controllers/setting/setting_controller.dart';
import 'package:familiar_stranger_v2/controllers/user/authController.dart';
import 'package:familiar_stranger_v2/controllers/user/userController.dart';
import 'package:familiar_stranger_v2/ui/screens/chat/calling/calling.dart';
import 'package:familiar_stranger_v2/ui/screens/home/mainscreen.dart';
import 'package:familiar_stranger_v2/ui/screens/open_image/image.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/edit/edit.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/forgot/forgot.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/forgot/reset_password.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/forgot/verify.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/login/login.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/signup/before_login.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/signup/signup.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/signup/waiting_before.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Familiar Stranger',
      theme: AppTheme.light,
      // home: const SplashScreen(),
      home: const CallingScreen(),
      initialBinding: InitialBinding(),

      //initialRoute: '/loginScreen',
      getPages: [
        GetPage(name: "/mainScreen", page: () => const MainScreen()),
        GetPage(name: "/loginScreen", page: () => const LoginScreen()),
        GetPage(name: "/forgotScreen", page: () => const ForgotScreen()),
        GetPage(name: "/signUpScreen", page: () => const SignUpScreen()),
        GetPage(
            name: "/waitingScreen",
            page: () => const WaitingBeforeLoginScreen()),
        GetPage(
            name: "/beforeLoginScreen", page: () => const BeforeLoginScreen()),
        GetPage(name: "/editProfileScreen", page: () => const EditScreen()),
        GetPage(name: "/verifyScreen", page: () => const VerifyScreen()),
        GetPage(
            name: "/resetPasswordScreen",
            page: () => const ResetPasswordScreen()),
        GetPage(name: "/image", page: () => const ImageScreen()),
      ],
    );
  }
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
}
