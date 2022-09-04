import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/myController.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/textfields/multiline_textfield.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/textfields/oneline_textfield.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/textfields/year_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  MyController myController = Get.put(MyController());

  final username = TextEditingController();
  final emotion = TextEditingController();
  final fullname = TextEditingController();
  final year = TextEditingController();
  final description = TextEditingController();
  final status = TextEditingController();
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
            'Edit',
            style: TextStyle(
                color: primaryText, fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          //leading: IconButton(onPressed: (){}, icon: Image.asset('assets/icons/Back_black.png', scale: 1*size.width/414,)),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right: 5.0 * size.width / 414, top: 5.0 * size.height / 896),
              child: GestureDetector(
                  onTap: () async {
                    myController.updateProfile(
                        username.text,
                        emotion.text,
                        fullname.text,
                        year.text,
                        description.text,
                        status.text);
                  },
                  child: Image.asset(
                    'assets/icons/Save.png',
                    scale: 5,
                  )),
            ),
          ],
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
                  OneLineTextField(controller: username, hint: 'Username'),
                  SizedBox(height: 24 * size.height / 896),
                  OneLineTextField(controller: emotion, hint: 'Emotion'),
                  SizedBox(height: 24 * size.height / 896),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/Male.png',
                          scale: 3,
                        ),
                      ),
                      SizedBox(
                        width: 24 * size.width / 414,
                      ),
                      YearTextField(controller: year),
                      SizedBox(
                        width: 24 * size.width / 414,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/Female.png',
                          scale: 3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24 * size.height / 896),
                  MultilineTextField(
                    onChanged: (value) {},
                    controller: description,
                  ),
                  SizedBox(height: 24 * size.height / 896),
                  OneLineTextField(controller: status, hint: 'Status'),
                  SizedBox(height: 50 * size.height / 896),
                  const Text(
                    'Images:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2 * size.height / 896),
                  Divider(
                    indent: size.width * 0.101,
                    endIndent: size.width * 0.101,
                    thickness: 2,
                    color: fieldBorder,
                  ),
                  SizedBox(height: 15 * size.height / 896),
                  SizedBox(
                    height: 370 * size.height / 896,
                    width: 370 * size.width / 414,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                        ),
                        padding: EdgeInsets.all(10 * size.width / 414),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 165 * size.height / 896,
                                width: 100 * size.width / 414,
                                decoration: BoxDecoration(
                                    color: secondaryText,
                                    border: Border.all(
                                        color: fieldBorder, width: 2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0))),
                                child: GestureDetector(
                                    onTap: () {
                                      //click to view Photo
                                    },
                                    onLongPress: () {
                                      //use to Delete
                                    },
                                    child: Image.asset(
                                      'assets/images/Vector.png',
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(height: 20 * size.height / 896),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundButton(
                          borderColor: secondaryColor,
                          backgroundColor: secondaryText,
                          textColor: primaryText,
                          text: 'Upload',
                          press: () {}),
                      SizedBox(
                        width: 28 * size.width / 414,
                      )
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
