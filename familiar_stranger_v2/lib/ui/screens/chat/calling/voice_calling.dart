import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/services/calling_service.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class VoiceCallingScreen extends StatefulWidget {
  const VoiceCallingScreen({Key? key}) : super(key: key);

  @override
  State<VoiceCallingScreen> createState() => _VoiceCallingScreenState();
}

class _VoiceCallingScreenState extends State<VoiceCallingScreen> {
  final voiceCallFunction = CallingFunction();
  late RtcEngine agoraEngine;
  int? _remoteUid;
  bool isVoice = true; // uid of the remote user
  bool _isJoined = false; // Indicates if the local user has joined the channel
  bool _isMuted = false;
  bool _isAvoidCam = false;
  bool _isFrontCam = true;

  @override
  void initState() {
    super.initState();
    voiceCallFunction.setupVoiceSDKEngine();
    //voiceCallFunction.setInformation("trungggg_qwer");
    voiceCallFunction.setInformation(Get.parameters["chatroom"]!);
  }

  void pressMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
    voiceCallFunction.pressMute(_isMuted);
  }

  void join() {
    print('Inforss: ${token} + ${userID} + ${channel}');
    voiceCallFunction.onVoiceJoin();
    setState(() {
      _isJoined = true;
    });
  }

  void leave() {
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
    voiceCallFunction.leaveChannel();
  }

  @override
  void dispose() async {
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
    await voiceCallFunction.leaveChannel();
    super.dispose();
  }

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
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              top: 255 * size.height / 896,
              child: Container(
                height: 300 * size.height / 896,
                width: 221 * size.width / 414,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: fieldBorder, width: 2),
                ),
                // child: Image.network('src'),
              )),
          Positioned(
            top: 577 * size.height / 896,
            child: const Text(
              'Unknown',
              style: TextStyle(
                  color: secondaryText,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            top: 622 * size.height / 896,
            child: const Text(
              'Calling...',
              style: TextStyle(
                  color: secondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w200),
            ),
          ),
          //Mute
          (_isJoined == true)
              ? Positioned(
                  top: 680 * size.height / 896,
                  child: ElevatedButton(
                    onPressed: () {
                      pressMute();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10.0),
                    ),
                    child: Icon(
                      Icons.mic_none_rounded,
                      color: (_isMuted == false) ? Colors.red : Colors.grey,
                      size: 35.0,
                    ),
                  ),
                )
              : Container(),
          (_isJoined == false)
              ? Positioned(
                  top: 773 * size.height / 896,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(
                          borderColor: secondaryText,
                          backgroundColor: acceptColor,
                          textColor: secondaryText,
                          text: 'Join',
                          press: () {
                            join();
                          }),
                      SizedBox(
                        width: 40 * size.width / 414,
                      ),
                      RoundButton(
                          borderColor: secondaryText,
                          backgroundColor: endColor,
                          textColor: secondaryText,
                          text: 'Ignore',
                          press: () {}),
                    ],
                  ))

              //EndButton
              : Positioned(
                  top: 773 * size.height / 896,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(
                          borderColor: secondaryText,
                          backgroundColor: endColor,
                          textColor: secondaryText,
                          text: 'End',
                          press: () {
                            leave();
                          }),
                    ],
                  )),
        ],
      ),
    ));
  }
}
