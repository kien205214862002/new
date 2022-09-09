import 'package:get/get.dart';

class MenuController extends GetxController {
  RxBool isHome = true.obs;
  RxBool isProfile = false.obs;
  RxBool isFriend = false.obs;
  RxBool isSetting = false.obs;

  void clickHome() {
    if (isHome.isTrue) {
    } else {
      isHome.value = true;
      isProfile.value = false;
      isFriend.value = false;
      isSetting.value = false;
    }
  }

  void clickProfile() {
    if (isProfile.isTrue) {
    } else {
      isHome.value = false;
      isProfile.value = true;
      isFriend.value = false;
      isSetting.value = false;
    }
  }

  void clickFriend() {
    if (isFriend.isTrue) {
    } else {
      isHome.value = false;
      isProfile.value = false;
      isFriend.value = true;
      isSetting.value = false;
    }
  }

  void clickSetting() {
    if (isSetting.isTrue) {
    } else {
      isHome.value = false;
      isProfile.value = false;
      isFriend.value = false;
      isSetting.value = true;
    }
  }
}
