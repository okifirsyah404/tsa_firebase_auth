import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool isDarkMode = true.obs;

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
  }
}
