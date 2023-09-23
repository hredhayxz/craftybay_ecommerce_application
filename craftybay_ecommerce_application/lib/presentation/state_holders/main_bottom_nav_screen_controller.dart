import 'package:get/get.dart';

class MainBottomNavScreenController extends GetxController {
  int currentSelectedIndex = 0;

  void changeScreen(int index) {
    currentSelectedIndex = index;
    update();
  }

  void backToHome() {
    changeScreen(0);
  }
}
