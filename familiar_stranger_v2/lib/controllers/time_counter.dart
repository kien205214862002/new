import 'dart:async';

import 'package:get/get.dart';

class CounterController extends GetxController{
  var obxCounterTime = 0.obs;
 RxBool obxIsCounter = false.obs;
  Timer? timer;
  void startCounter()
  {
    obxIsCounter.toggle();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      obxCounterTime.value++;
     });
    
  }

  void stopCounter()
  {
    stopTimer();
    obxCounterTime.value = 0;
    obxIsCounter.toggle();
  }

  void stopTimer()
  {
    timer?.cancel();
  }

}