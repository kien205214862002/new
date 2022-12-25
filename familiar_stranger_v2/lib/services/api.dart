import 'dart:convert';
import 'package:familiar_stranger_v2/controllers/conversationController.dart';
import 'package:familiar_stranger_v2/controllers/musicController.dart';
import 'package:familiar_stranger_v2/controllers/setting/setting_controller.dart';
import 'package:familiar_stranger_v2/controllers/user/notificationController.dart';
import 'package:familiar_stranger_v2/controllers/user/userController.dart';
import 'package:familiar_stranger_v2/models/user.dart';
import 'package:familiar_stranger_v2/models/image.dart' as img;
import 'package:familiar_stranger_v2/models/song.dart';
import 'package:familiar_stranger_v2/services/socketio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

var ip = 'fsserverv2-production.up.railway.app';

final userData = GetStorage();
//var token = userData.read('token');

UserController userController = Get.put(UserController());
SettingController settingController = Get.put(SettingController());
MusicController musicController = Get.put(MusicController());
ConversationController conversationController =
    Get.put(ConversationController());
NotificationController notificationController =
    Get.put(NotificationController());

Future<bool> submitLogin(phoneNumber, password) async {
  try {
    var response = await http.post(Uri.https(ip, '/user/login'),
        body: ({"phoneNumber": phoneNumber, "password": password}));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success'] == true) {
      userController.currentUser = User.fromJson(jsonData['user']).obs;
      userData.write(
          'token', userController.currentUser.value.token.toString());
      userData.write('isLogged', true);

      settingController
          .initSetting(userController.currentUser.value.settingId!);

      notificationController.loadInitNotification();
      musicController.loadInitMusic();

      debugPrint('Login successful');
      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> getListFriend() async {
  var token = userData.read('token');
  userController.currentListFriend = [];
  userController.currentListRecentConnect = [];
  try {
    var response = await http.get(Uri.https(ip, '/user/friend'),
        headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success'] == true) {
      jsonData['listFriendData'].forEach((v) {
        userController.currentListFriend.add(User.fromJson(v).obs);
      });
      jsonData['listRecentConnect'].forEach((v) {
        userController.currentListRecentConnect.add(User.fromJson(v).obs);
      });
    }
  } catch (e) {
    debugPrint('err get list friend $e');
  }
  return true;
}

Future<bool> addRecentConnect(id) async {
  var token = userData.read('token');
  try {
    var response = await http.post(
        Uri.https(ip, '/user/addrecentconnect'),
        body: ({"id": id}),
        headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success'] == true) {
      userController.currentUser.value.listRecentConnect!.add(id);
      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> checkUserExits(phoneNumber) async {
  try {
    var response = await http.post(
        Uri.https(ip, '/user/forgot/checkExists'),
        body: ({"phoneNumber": phoneNumber}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<int> getCodeResetPass(phoneNumber) async {
  try {
    var response = await http.post(
        Uri.https(ip, '/user/forgot/sendmail'),
        body: ({"phoneNumber": phoneNumber}));
    var jsonData = jsonDecode(response.body);

    if (jsonData['success']) {
      return jsonData['code'];
    } else {
      return 0;
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
    return 0;
  }
}

Future<bool> submitSignUp(phoneNumber, password) async {
  try {
    var response = await http.post(Uri.https(ip, '/user'),
        body: ({"phoneNumber": phoneNumber, "password": password}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> getUserByToken() async {
  var token = userData.read('token');
  try {
    var response = await http.get(Uri.https(ip, '/user'),
        headers: ({
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "authorization": token
        }));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success'] == true) {
      userController.currentUser = User.fromJson(jsonData['user']).obs;

      settingController
          .initSetting(userController.currentUser.value.settingId!);

      notificationController.loadInitNotification();
      musicController.loadInitMusic();

      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> getUserByID(id) async {
  try {
    var response = await http.get(Uri.https(ip, '/user/getUser/$id'));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success'] == true) {
      conversationController.targetUser = User.fromJson(jsonData['user']).obs;
      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> changeSetting(position) async {
  var token = userController.currentUser.value.token.toString();
  try {
    var response = await http.patch(Uri.https(ip, '/user/changesetting'),
        body: ({"position": "$position"}), headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> changeStatus(status) async {
  var token = userController.currentUser.value.token.toString();
  try {
    var response = await http.patch(Uri.https(ip, '/user/changestatus'),
        body: ({"status": status}), headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> editProfile(username, emotion, yearOfB, description, gmail) async {
  var token = userController.currentUser.value.token.toString();
  try {
    var response = await http.patch(Uri.https(ip, '/user'),
        body: ({
          "username": username,
          "emotion": emotion,
          "yearOfB": yearOfB,
          "description": description,
          "gmail": gmail
        }),
        headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> uploadAvatar(path) async {
  var token = userController.currentUser.value.token.toString();
  try {
    var request =
        http.MultipartRequest('POST', Uri.https(ip, '/user/upAvatar'));
    request.files.add(await http.MultipartFile.fromPath('avatar', path));
    request.headers.addAll(
        {'Content-type': 'multipart/form-data', 'authorization': token});
    var response = await request.send();
    final resStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(resStr);
    if (jsonData['success']) {
      //print(myController.currentUser.value.listImage![0]);
      Future.delayed(const Duration(seconds: 3), () async {
        print(
            userController.currentUser.value.listImage![0].imageUrl.toString());
      });
      userController.currentUser.value.listImage![0] =
          img.Image.fromJson(jsonData['avatar']);
      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> upImage(path) async {
  var token = userController.currentUser.value.token.toString();
  try {
    var request =
        http.MultipartRequest('POST', Uri.https(ip, '/user/addImage'));
    request.files.add(await http.MultipartFile.fromPath('image', path));
    request.headers.addAll(
        {'Content-type': 'multipart/form-data', 'authorization': token});
    var response = await request.send();
    final resStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(resStr);
    if (jsonData['success']) {
      Future.delayed(const Duration(seconds: 3), () async {
        print(userController.currentUser.value.listImage!.length.toString());
      });
      userController.currentUser.value.listImage![userController.currentUser.value.listImage!.length] 
      = img.Image.fromJson(jsonData['image']);
      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<String> upImageMessage(path) async {
  try {
    var request = http.MultipartRequest('POST', Uri.https(ip, '/user/addImageMess'));
    request.files.add(await http.MultipartFile.fromPath('image', path));

    var response = await request.send();
    final resStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(resStr);
    if (jsonData['success']) {
      return jsonData['imageUrl'].toString();
    }
    return 'https://res.cloudinary.com/fs-app/image/upload/v1649060973/unnamed_vfgxcq.png';
  } on Exception catch (e) {
    debugPrint(e.toString());
    return 'https://res.cloudinary.com/fs-app/image/upload/v1649060973/unnamed_vfgxcq.png';
  }
}


Future<bool> submitResetPassword(phoneNumber, newPassword) async {
  try {
    var response = await http.post(Uri.https(ip, '/user/resetPassword'),
        body: ({"phoneNumber": phoneNumber, "newPassword": newPassword}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> addFriend(friendId) async {
  var token = userController.currentUser.value.token.toString();
  try {
    var response = await http.post(Uri.https(ip, '/user/friend'),
        body: ({"friendId": friendId}),
        headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);
    if(jsonData['success'] == true && jsonData['message'] == "Add friend"){
      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}


Future<bool> addNotificationToData(senderId, targetId, type, content) async {
  try {
    var response = await http.post(Uri.https(ip, '/notification'),
        body: ({
          "senderId": senderId,
          "targetId": targetId,
          "type": type,
          "content": content,
          "read": "false"
        }));
    var jsonData = jsonDecode(response.body);

    return jsonData['success'];
  } catch (e) {
    print('object');
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> getNotification() async {
  var token = userController.currentUser.value.token.toString();
  try {
    var response = await http.get(Uri.https(ip, '/notification'),
        headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);

    if (jsonData['success'] == true) {
      jsonData['listNotification'].forEach((v) {
        notificationController.addNotification(v);
      });
    }

    return jsonData['success'];
  } catch (e) {
    print('object');
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> getAllSong() async {
  try {
    var response = await http.get(Uri.https(ip, '/music'));
    var jsonData = jsonDecode(response.body);

    if (jsonData['success'] == true) {
      jsonData['data'].forEach((v) {
        musicController.listMusic.add(Song.fromJson(v));
      });
    }

    return jsonData['success'];
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
