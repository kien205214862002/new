import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/welcome_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/circle_button.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/left_click.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/phone_textfield.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/widgets/right_click.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

showSnackbar(title, message, IconData icon) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(icon, color: Colors.white));
}

class _VerifyScreenState extends State<VerifyScreen> {

 var argumentData = Get.arguments;

  final codeController = TextEditingController();
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
            SizedBox(height: 82*size.height/896,),
            Text("Type imcoming mesage's code:", style: TextStyle( color: primaryText, fontSize: 18*size.height/896),),
            SizedBox(height: 21*size.height/896,),
            PhoneField(controller: codeController,hint: 'Code',),
            SizedBox(height: 15*size.height/896,),
            CircleButton(press: (){
              if(argumentData['code'].toString() == codeController.text.toString()){
                Get.toNamed('/resetPasswordScreen',arguments: {'phoneNumber':argumentData['phoneNumber'].toString()});
              } else {
                showSnackbar('Verify fail', 'Check code again pls', Icons.error);
              }
            }, title: 'GET'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LeftClick(title: 'SIGN UP', press: (){}),
                      RightClick(title: 'LOG IN', press: (){})
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
