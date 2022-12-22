import 'dart:ui';

import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/user/authController.dart';
import 'package:familiar_stranger_v2/controllers/user/userController.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/textfields/multiline_textfield.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/textfields/oneline_textfield.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/textfields/year_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {

  UserController userController = Get.put(UserController());

  final description = TextEditingController();
  bool haveImage = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(3.0),
          //   child: Container(
          //     color: primaryText,
          //     height: 1.5,
          //   ),
          // ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Add Image',
            style: TextStyle(
                color: primaryText, fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: Image.asset(
          //       'assets/icons/Back_black.png',
          //       scale: 1 * size.width / 414,
          //     )),
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.only(
          //         right: 5.0 * size.width / 414, top: 5.0 * size.height / 896),
          //     child: GestureDetector(
          //         onTap: () {},
          //         child: Image.asset(
          //           'assets/icons/Save.png',
          //           scale: 5,
          //         )),
          //   ),
          // ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: HomeBG(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20 * size.height / 896,
                  ),
                  Container(
                    height: 600 * size.height / 896,
                    width: 350 * size.width / 414,
                    decoration: BoxDecoration(
                      border: Border.all(color: fieldBorder, width: 2.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        userController.addImage();
                        setState(() {
                          haveImage = !haveImage;
                        });
                      },
                      child: (haveImage == false) ? const Icon(Icons.add, color: secondaryText, size: 100,) : Image.asset('assets/images/Logo.png'),
                    ),
                  ),
                  SizedBox(height: 24 * size.height / 896),
                  // MultilineTextField(
                  //   onChanged: (value) {},
                  //   controller: description,
                  //   hint: '',
                  // ),
                  SizedBox(height: 24 * size.height / 896),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundButton(borderColor: secondaryColor, backgroundColor: secondaryText, textColor: primaryText, text: 'Upload', press: (){}),
                      SizedBox(width: 28*size.width/414,)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
