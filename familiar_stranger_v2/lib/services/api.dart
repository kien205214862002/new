import 'dart:convert';
import 'package:familiar_stranger_v2/controllers/myController.dart';
import 'package:familiar_stranger_v2/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

var ip = '192.168.2.37';

final userData = GetStorage();
var token = userData.read('token');

MyController myController = Get.put(MyController());

Future<bool> submitLogin(phoneNumber, password) async {
  var response = await http.post(Uri.http('$ip:3000', '/user/login'),
      body: ({"phoneNumber": phoneNumber, "password": password}));
  var jsonData = jsonDecode(response.body);
  if (jsonData['success'] == true) {
    myController.currentUser = User.fromJson(jsonData['user']).obs;

    // ignore: avoid_print
    print('Login successful');
    return true;
  } else {
    // ignore: avoid_print
    print('Login err');
    return false;
  }
}

Future<bool> submitSignUp(phoneNumber, password) async {
  var response = await http.post(Uri.http('$ip:3000', '/user'),
      body: ({"phoneNumber": phoneNumber, "password": password}));
  var jsonData = jsonDecode(response.body);
  if (jsonData['success'] == true) {
    return true;
  }
  return false;
}

Future<bool> getUser(token) async {
  var response = await http.get(Uri.http('$ip:3000', '/user'),
      headers: ({
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "authorization": token
      }));
  var jsonData = jsonDecode(response.body);
  if (jsonData['success'] == true) {
    myController.currentUser = User.fromJson(jsonData['user']).obs;
    return true;
  }
  return false;
}

Future<bool> editProfile(
    username, emotion, fullname, yearOfB, descripsion, status) async {
  var response = await http.patch(Uri.http('$ip:3000', '/user'),
      body: ({"username": username}), headers: ({"authorization": token}));

  var jsonData = jsonDecode(response.body);
  return jsonData['success'];
}

Future<bool> uploadAvatar(path) async {
  var request = http.MultipartRequest('POST', Uri.http('$ip:3000', '/user/upAvatar'));
  request.files.add(await http.MultipartFile.fromPath('avatar', path));
  request.headers.addAll({
    'Content-type': 'multipart/form-data',
    'authorization': token
  });
  var response = await request.send();
  final resStr = await response.stream.bytesToString();
  var jsonData = jsonDecode(resStr);
  return jsonData['success'];
}