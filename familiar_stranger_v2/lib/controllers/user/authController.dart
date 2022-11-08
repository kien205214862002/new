import 'package:familiar_stranger_v2/controllers/user/userController.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:familiar_stranger_v2/services/socketio.dart';
import 'package:get/get.dart';

UserController userController = Get.put(UserController());

class AuthController extends GetxController {
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
      signinSocket(userController.currentUser.value.id);
      var bl = await getListFriend();
      return bl;
    }
    return false;
  }

  Future<bool> loginByToken() async {
    if (await getUserByToken()) {
      signinSocket(userController.currentUser.value.id);
      return await getListFriend();
    }
    return false;
  }

  Future<bool> logout() async {
    logoutSocket();
    userData.remove('token');
    userData.write('isLogged', false);
    Get.offNamed('/loginScreen');
    return true;
  }
}
