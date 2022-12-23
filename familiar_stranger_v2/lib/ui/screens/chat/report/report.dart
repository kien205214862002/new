import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:familiar_stranger_v2/ui/screens/chat/widgets/multi_textline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Report',
            style: TextStyle(
                color: primaryText, fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: HomeBG(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20 * size.width / 414),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100 * size.height / 896),
                    const Text(
                      'Write your reasons: ',
                      style: TextStyle(color: primaryText, fontSize: 17),
                    ),
                    SizedBox(height: 15 * size.height / 896),
                    MultiTextField(onChanged: (value) {}, controller: controller,),
                    SizedBox(height: 8 * size.height / 896),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RoundButton(
                            borderColor: thirdColor,
                            backgroundColor: secondaryText,
                            textColor: primaryText,
                            text: 'Send',
                            press: () {
                              Get.back();
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
