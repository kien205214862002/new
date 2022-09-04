import 'package:familiar_stranger_v2/models/user.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  late Rx<User> currentUser;

  void updateProfile(username, emotion, fullname, yearOfB, descripsion, status) async {
    if (!await editProfile(username, emotion, fullname, yearOfB, descripsion, status)) {
      return;
    }

    currentUser.update((user) {
      if (username.isNotEmpty) {
        user!.username = username;
      }
      if (emotion.isNotEmpty) {
        user!.username = emotion;
      }
      if (fullname.isNotEmpty) {
        user!.username = fullname;
      }
      if (yearOfB.isNotEmpty) {
        user!.username = yearOfB;
      }
      if (descripsion.isNotEmpty) {
        user!.username = descripsion;
      }
      if (status.isNotEmpty) {
        user!.username = status;
      }
    });
  }
}
