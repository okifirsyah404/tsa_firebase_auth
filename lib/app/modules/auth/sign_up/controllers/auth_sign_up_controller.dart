import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthSignUpController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    // TODO: implement onInit

    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }


  @override
  void onClose() {
    // TODO: implement onClose

    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
