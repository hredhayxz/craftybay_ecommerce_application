import 'dart:async';

import 'package:get/get.dart';

class OtpVerificationScreenController extends GetxController
{
  int seconds = 10;
  late Timer _timer;
  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      seconds == 0 ? _timer.cancel() : seconds--;
      update();
    });
  }
}
