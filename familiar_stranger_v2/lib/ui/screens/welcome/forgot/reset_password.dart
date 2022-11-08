import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/user/authController.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/welcome_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/circle_button.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/left_click.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/password_textfield.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/right_click.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

showSnackbar(title, message,IconData icon){
  Get.snackbar(title, message, 
    snackPosition: SnackPosition.BOTTOM, 
    icon: Icon(icon, color: Colors.white));
}


class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  var argumentData = Get.arguments;

  AuthController authController = Get.put(AuthController());

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
            SizedBox(height: 150*size.height/896,),
            SizedBox(
                height: 150*size.height/896,
                width: 200*size.width/414,
                child: Image.asset('assets/images/Logo.png', fit: BoxFit.fill,)),
            SizedBox(height: 23*size.height/896,),
            Text('Familiar Stranger', style: TextStyle( color: primaryText, fontFamily: 'NewRocker', fontSize: 35*size.height/896),),
            SizedBox(height: 83*size.height/896,),
            Text('Reset Password:', style: TextStyle( color: primaryText, fontSize: 18*size.height/896),),
            SizedBox(height: 23*size.height/896,),
            PasswordField(controller: passwordController,hint: 'New password', press: (){},),
            SizedBox(height: 23*size.height/896,),
            PasswordField(controller: passwordRetypeController,hint: 'Retype new password', press: (){},),
            SizedBox(height: 23*size.height/896,),
            CircleButton(press: () async {
              if(passwordController.text.toString() == passwordRetypeController.text.toString()){
                var result = await authController.resetPassword(argumentData['phoneNumber'].toString(), passwordController.text.toString());
                if(result){
                  Get.offAllNamed('/loginScreen');
                  showSnackbar('Reset password success','Login pls',Icons.check);
                }else{
                  showSnackbar('Reset password fail', 'Password don\'t match', Icons.error);
                }
              }else{
                showSnackbar('Reset password fail', 'Password don\'t match', Icons.error);
              }
            }, title: 'GO'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LeftClick(title: 'SIGN UP', press: (){
                        Get.offNamed('/signupScreen');
                      }),
                      RightClick(title: 'LOG IN', press: (){
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
