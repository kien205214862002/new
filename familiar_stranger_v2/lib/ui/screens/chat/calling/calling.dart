import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:flutter/material.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({Key? key}) : super(key: key);

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: callingBG,
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
              '',
              style: TextStyle(
                  color: secondaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            // actions: [
            //   GestureDetector(
            //       onTap: () {},
            //       child: Image.asset(
            //         'assets/icons/Edit Mailbox.png',
            //         scale: 3.5,
            //       )),
            // ],
          ),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 255*size.height/896,
              child: Container(
                height: 300*size.height/896,
                width: 221*size.width/414,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: fieldBorder, width: 2),
                ),
                // child: Image.network('src'),
              )),
              Positioned(
              top: 577*size.height/896,
              child: const Text('Unknown', style: TextStyle(
                color: secondaryText, fontSize: 22, fontWeight: FontWeight.w400),),
              ),
              Positioned(
              top: 622*size.height/896,
              child: const Text('Calling...', style: TextStyle(
                color: secondaryText, fontSize: 16, fontWeight: FontWeight.w200),),
              ),
              Positioned(
              top: 773*size.height/896,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundButton(borderColor: secondaryText, backgroundColor: acceptColor, textColor: secondaryText, text: 'Accept', press: (){}),
                  SizedBox(width: 40*size.width/414,),
                  RoundButton(borderColor: secondaryText, backgroundColor: endColor, textColor: secondaryText, text: 'Ignore', press: (){}),
                ],
              )
              ),

              //Switch
              // Positioned(
              //   top: 54*size.height/896,
              //   child: 
              //   ),

              //Call Stream
              Positioned(
                top: 114*size.height/896,
                child: Visibility(
                  visible: false,
                  child: Container(
                    height: 644*size.height/896,
                    width: 329*size.width/414,
                    decoration: BoxDecoration(
                      border: Border.all(color: fieldBorder, width: 2),
                    ),
                    // child: Stack(
                    //   children: [
                    //     Positioned.fill(
                    //       child: )
                    //   ],
                    // ),
                  ),
                )),

                //EndButton
                Positioned(
              top: 773*size.height/896,
              child: Visibility(
                visible: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundButton(borderColor: secondaryText, backgroundColor: endColor, textColor: secondaryText, text: 'End', press: (){}),
                  ],
                ),
              )
              ),

          ],
        ),
      )
    );
  }
}