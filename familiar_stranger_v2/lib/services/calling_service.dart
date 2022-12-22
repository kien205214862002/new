import 'dart:math';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/services/call_token.dart';
import 'package:permission_handler/permission_handler.dart';

class CallingFunction {
  ClientRoleType? hostRole = ClientRoleType.clientRoleBroadcaster;
  late RtcEngine agoraEngine;
  int? _remoteUid;
  RtcConnection connect = RtcConnection();
  TokenGenerator tokenGenerator = TokenGenerator();

  //token renew if expiring
  void renewToken() {
    agoraEngine.renewToken(token);
    print('Token renew');
  }

  Future<void> setInformation(String channelCall) async {
    channel = channelCall;
    print(channel);
    tokenGenerator.fetchToken(userID, channel, tokenRole);
    print(token);
    print('Inforss: ${token} + ${userID} + ${channel}');
  }

  //Setup Voice
  Future<void> setupVoiceSDKEngine() async {
    // // retrieve or request microphone permission
    // await [Permission.microphone].request();

    //create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(const RtcEngineContext(appId: appID));

    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print('create channel to connect');
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          print('User${remoteUid} connect!');
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          print("User ${remoteUid} disconnect!");
        },
      ),
    );
  }

//handle Permission
  Future<void> handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

//Join Channel
  Future<void> onVoiceJoin() async {
    // await handleCameraAndMic(Permission.microphone);
    // await [Permission.microphone].request();

    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );
    // renewToken();
    await agoraEngine.joinChannel(
      token: token,
      channelId: channel,
      options: options,
      uid: userID,
    );
  }

  //leave Channel

  Future<void> leaveChannel() async {
    agoraEngine.leaveChannel();
  }

  ////Video
  ///SetupVideo
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
          // setState(() {
          //     _isJoined = true;
          // });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          print("Remote user uid:$remoteUid joined the channel");
          // setState(() {
          //     _remoteUid = remoteUid;
          // });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          print("Remote user uid:$remoteUid left the channel");
          // setState(() {
          //     _remoteUid = null;
          // });
        },
      ),
    );
  }

  Future<void> joinVideoCall() async {
    await agoraEngine.startPreview();

    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await agoraEngine.joinChannel(
      token: token,
      channelId: channel,
      options: options,
      uid: userID,
    );
  }

  void pressMute(bool check) {
    agoraEngine.muteLocalAudioStream(check);
  }

  void pressCamera(bool check) {
    agoraEngine.muteLocalVideoStream(check);
  }

  void toggleCamera() {
    agoraEngine.switchCamera();
  }
}
