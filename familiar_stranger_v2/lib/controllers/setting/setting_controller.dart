import 'package:get/get.dart';

class SettingController extends GetxController{
  RxBool soundActive = true.obs;
  RxBool notificationActive = false.obs;
  RxBool vibrationActive = false.obs;
  RxBool statusActive = false.obs;

  void changeSoundSetting()
  {
    soundActive.toggle();
  }

  void changeNotificationSetting()
  {
    notificationActive.toggle();
  }

  void changeVibrationSetting()
  {
    vibrationActive.toggle();
  }

  void changeStatusSetting()
  {
    statusActive.toggle();
  }
}