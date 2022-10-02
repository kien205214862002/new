import 'package:familiar_stranger_v2/models/setting.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  // late Rx<Setting> currentSetting;
  
  RxBool soundActive = true.obs;
  RxBool notificationActive = true.obs;
  RxBool vibrationActive = true.obs;
  RxBool statusActive = false.obs;

  void initSetting(Setting setting) {
    soundActive = setting.sound!.obs;
    notificationActive = setting.notification!.obs;
    vibrationActive = setting.vibration!.obs;
    statusActive = (setting.status == 'offline') ? false.obs : true.obs;
  }

  void changeSoundSetting() async {
    if (await changeSetting('1')) {
      soundActive.toggle();
    }
  }

  void changeNotificationSetting() async {
    if (await changeSetting('2')) {
      notificationActive.toggle();
    }
  }

  void changeVibrationSetting() async {
    if (await changeSetting('3')) {
      vibrationActive.toggle();
    }
  }

  void changeStatusSetting() async {
    if (statusActive.value) {
      if (await changeStatus('offline')) {
        statusActive.toggle();
      }
    } else {
      if (await changeStatus('online')) {
        statusActive.toggle();
      }
    }
  }
}
