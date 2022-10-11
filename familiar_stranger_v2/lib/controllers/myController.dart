import 'package:familiar_stranger_v2/models/user.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyController extends GetxController {
  late Rx<User> currentUser;
  List<Rx<User>> currentListFriend = [];

  Future<bool> checkExists(phoneNumber) async {
    if (await checkUserExits(phoneNumber)) {
      return true;
    }
    return false;
  }

  Future<int> sendMailGetCode(phoneNumber) async {
    var code = await getCodeResetPass(phoneNumber);
    return code;
  }

  Future<bool> resetPassword(phoneNumber, newPassword) async {
    return await submitResetPassword(phoneNumber, newPassword);
  }

  Future<bool> signUp(phoneNumber, password) async {
    if (await submitSignUp(phoneNumber, password)) {
      return true;
    }
    return false;
  }

  Future<bool> login(phoneNumber, password) async {
    if (await submitLogin(phoneNumber, password)) {
      return await getListFriend();
      //return true;
    }
    return false;
  }

  Future<bool> loginByToken() async {
    if (await getUser()) {
      return await getListFriend();
    }
    return false;
  }

  void updateProfile(username, emotion, yearOfB, description) async {
    if (!await editProfile(username, emotion, yearOfB, description)) {
      return;
    }

    currentUser.update((user) {
      if (username.isNotEmpty) {
        user!.username = username;
      }
      if (emotion.isNotEmpty) {
        user!.emotion = emotion;
      }
      if (yearOfB.isNotEmpty) {
        user!.yearOfB = yearOfB;
      }
      if (description.isNotEmpty) {
        user!.description = description;
      }
    });
  }

  Future<bool> upAvatar() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      var image = await imagePicker.pickImage(source: ImageSource.gallery);
      if(image != null) {
        print('${currentUser.value.listImage![0].imageUrl.toString()}  1 2');
        await uploadAvatar(image.path.toString());
        // Future.delayed(const Duration(seconds: 3),() async {
        //   print(currentUser.value.listImage![0].imageUrl.toString());
        //   await uploadAvatar(image.path.toString());
        //   print(currentUser.value.listImage![0].imageUrl.toString());
        // });
        print('${currentUser.value.listImage![0].imageUrl.toString()}  1 2');
        // currentUser.update((user) {
        //   user!.listImage[0] = 
        // });
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> changePassword(oldPass, newPass) async {
    return false;
  }
}
