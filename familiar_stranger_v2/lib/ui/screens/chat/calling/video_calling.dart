import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/services/calling_service.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class VideoCallingScreen extends StatefulWidget {
  const VideoCallingScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallingScreen> createState() => _VideoCallingScreenState();
}

class _VideoCallingScreenState extends State<VideoCallingScreen> {
  final videoCallFunction = CallingFunction();
  late RtcEngine agoraEngine;
  int? _remoteUid;
  bool isVoice = true; // uid of the remote user
  bool _isJoined = false; // Indicates if the local user has joined the channel
  bool _isMuted = false;
  bool _isAvoidCam = false;
  bool _isFrontCam = true;
  @override
  void initState() {
    setupVideoSDKEngine();
    videoCallFunction.setInformation(Get.parameters["chatroom"]!);
    // videoCallFunction.setInformation(Get.parameters["chatroom"]!);
    // setState(() {
    //   _isJoined == true;
    // });
    super.initState();
  }

  Future<void> setupVideoSDKEngine() async {
    // retrieve or request camera and microphone permissions
    await [Permission.microphone, Permission.camera].request();

    //create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(const RtcEngineContext(appId: appID));

    await agoraEngine.enableVideo();

    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print("Local user uid:${connection.localUid} joined the channel");
          setState(() {
            _isJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          print("Remote user uid:$remoteUid joined the channel");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          print("Remote user uid:$remoteUid left the channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );
  }

  void join() async {
    print('Inforss: ${token} + ${userID} + ${channel}');
    await agoraEngine.startPreview();

    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );
    setState(() {
      _isJoined = true;
    });
    await agoraEngine.joinChannel(
      token: token,
      channelId: channel,
      options: options,
      uid: userID,
    );
  }

  void leave() {
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
    agoraEngine.leaveChannel();
  }

  void pressMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
    agoraEngine.muteLocalAudioStream(_isMuted);
  }

  void pressCamera() {
    setState(() {
      _isAvoidCam = !_isAvoidCam;
    });
    agoraEngine.muteLocalVideoStream(_isAvoidCam);
  }

  void toggleCamera() {
    setState(() {
      _isFrontCam = !_isFrontCam;
    });
    agoraEngine.switchCamera();
  }

  @override
  void dispose() async {
    await agoraEngine.leaveChannel();
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
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
          (_isJoined == false)
              ? Positioned(
                  top: 255 * size.height / 896,
                  child: Container(
                    height: 300 * size.height / 896,
                    width: 221 * size.width / 414,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: fieldBorder, width: 2),
                    ),
                    // child: Image.network('src'),
                  ))
              :
              //remote view
              Positioned(
                  top: 50 * size.height / 896,
                  child: Container(
                    height: 644 * size.height / 896,
                    width: 329 * size.width / 414,
                    decoration: BoxDecoration(
                      border: Border.all(color: fieldBorder, width: 2),
                    ),
                    child: _remoteVideo(),
                  )),
          //localview
          (_isJoined == false)
              ? Container()
              : Positioned(
                  top: 544 * size.height / 896,
                  left: 271.5 * size.width / 414,
                  child: Container(
                    height: 150 * size.height / 896,
                    width: 100 * size.width / 414,
                    decoration: BoxDecoration(
                      border: Border.all(color: fieldBorder, width: 2),
                    ),
                    child: _localPreview(),
                  )),
          (_isJoined == false)
              ? Positioned(
                  top: 577 * size.height / 896,
                  child: const Text(
                    'Unknown',
                    style: TextStyle(
                        color: secondaryText,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                )
              : Container(),
          (_isJoined == false)
              ? Positioned(
                  top: 622 * size.height / 896,
                  child: const Text(
                    'Calling...',
                    style: TextStyle(
                        color: secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                )
              : Container(),
          //StartButton
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
                          press: () {
                            // leave();
                          }),
                    ],
                  ))
              : //EndButton
              Positioned(
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
          //Function Button
          (_isJoined == false)
              ? Container()
              : Positioned(
                  top: 700 * size.height / 896,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Button Mic
                      OutlinedButton(
                        onPressed: () {
                          pressMute();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                              color: (_isMuted == false)
                                  ? Colors.green
                                  : Colors.grey,
                              width: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(7.0),
                        ),
                        child: Icon(
                          Icons.mic,
                          color:
                              (_isMuted == false) ? Colors.blue : Colors.grey,
                          size: 25.0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      //Button Camera
                      OutlinedButton(
                        onPressed: () {
                          pressCamera();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                              color: (_isAvoidCam == false)
                                  ? Colors.green
                                  : Colors.grey,
                              width: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(7.0),
                        ),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: (_isAvoidCam == false)
                              ? Colors.blue
                              : Colors.grey,
                          size: 25.0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      //Button Switch Camera
                      OutlinedButton(
                        onPressed: () {
                          toggleCamera();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                              color: (_isFrontCam == false)
                                  ? Colors.red
                                  : Colors.green,
                              width: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(7.0),
                        ),
                        child: Icon(
                          Icons.swap_calls,
                          color:
                              (_isFrontCam == false) ? Colors.red : Colors.blue,
                          size: 25.0,
                        ),
                      ),
                    ],
                  )),
          //Call Stream
        ],
      ),
    ));
  }

  Widget _localPreview() {
    if (_isJoined == true) {
      return AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: agoraEngine,
          canvas: const VideoCanvas(uid: 0),
        ),
      );
    } else {
      return const Text(
        'Join a channel',
        textAlign: TextAlign.center,
      );
    }
  }

// Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: agoraEngine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: channel),
        ),
      );
    } else {
      String msg = '';
      if (_isJoined) msg = 'Waiting for a remote user to join';
      return Text(
        msg,
        textAlign: TextAlign.center,
      );
    }
  }
}
