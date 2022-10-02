import 'dart:convert';
import 'package:familiar_stranger_v2/controllers/myController.dart';
import 'package:familiar_stranger_v2/controllers/setting/setting_controller.dart';
import 'package:familiar_stranger_v2/models/user.dart';
import 'package:familiar_stranger_v2/models/image.dart' as img;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

var ip = '192.168.2.189';

final userData = GetStorage();
var token = userData.read('token');

MyController myController = Get.put(MyController());
SettingController settingController = Get.put(SettingController());

Future<bool> submitLogin(phoneNumber, password) async {
  try {
    var response = await http.post(Uri.http('$ip:3000', '/user/login'),
        body: ({"phoneNumber": phoneNumber, "password": password}));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success'] == true) {
      myController.currentUser = User.fromJson(jsonData['user']).obs;
      userData.write('token', myController.currentUser.value.token);
      userData.write('isLogged', true);

      settingController.initSetting(myController.currentUser.value.settingId!);

      debugPrint('Login successful');
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
        Uri.http('$ip:3000', '/user/forgot/checkExists'),
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
        Uri.http('$ip:3000', '/user/forgot/sendmail'),
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
    var response = await http.post(Uri.http('$ip:3000', '/user'),
        body: ({"phoneNumber": phoneNumber, "password": password}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> getUser() async {
  try {
    var response = await http.get(Uri.http('$ip:3000', '/user'),
        headers: ({
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "authorization": token
        }));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success'] == true) {
      myController.currentUser = User.fromJson(jsonData['user']).obs;

      settingController.initSetting(myController.currentUser.value.settingId!);

      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> changeSetting(position) async {
  try {
    var response = await http.patch(Uri.http('$ip:3000', '/user/changesetting'),
        body: ({"position": "$position"}), headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> changeStatus(status) async {
  try {
    var response = await http.patch(Uri.http('$ip:3000', '/user/changestatus'),
        body: ({"status": status}), headers: ({"authorization": token}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> editProfile(username, emotion, yearOfB, description) async {
  try {
    var response = await http.patch(Uri.http('$ip:3000', '/user'),
        body: ({
          "username": username,
          "emotion": emotion,
          "yearOfB": yearOfB,
          "description": description
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
  try {
    var request =
        http.MultipartRequest('POST', Uri.http('$ip:3000', '/user/upAvatar'));
    request.files.add(await http.MultipartFile.fromPath('avatar', path));
    request.headers.addAll(
        {'Content-type': 'multipart/form-data', 'authorization': token});
    var response = await request.send();
    final resStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(resStr);
    if (jsonData['success']) {
      //print(myController.currentUser.value.listImage![0]);
      Future.delayed(const Duration(seconds: 3),() async {
          print(myController.currentUser.value.listImage![0].imageUrl.toString());
        });
      myController.currentUser.value.listImage![0] = img.Image.fromJson(jsonData['avatar']);
      return true;
    }
    return false;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> submitResetPassword(phoneNumber, newPassword) async {
  try {
    var response = await http.post(Uri.http('$ip:3000', '/user/resetPassword'),
        body: ({"phoneNumber": phoneNumber, "newPassword": newPassword}));
    var jsonData = jsonDecode(response.body);
    return jsonData['success'];
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
