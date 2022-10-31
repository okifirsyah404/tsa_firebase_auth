import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthSignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    // TODO: implement onInit

    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

}
