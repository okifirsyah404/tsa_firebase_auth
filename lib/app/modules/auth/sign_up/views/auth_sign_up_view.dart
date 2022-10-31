import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/themes/color_theme.dart';
import '../../../global/themes/typography_theme.dart';
import '../../../global/widgets/text_field/password_text_field/password_text_field.dart';
import '../../../global/widgets/text_field/regular_text_field/regular_text_field.dart';
import '../../controllers/auth_controller.dart';
import '../controllers/auth_sign_up_controller.dart';

class AuthSignUpView extends GetView<AuthSignUpController> {
  AuthSignUpView({Key? key}) : super(key: key);

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Register",
                          style: TypographyTheme.headlineMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: ColorsTheme.primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Silahkan register untuk melanjutkan",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RegularTextField(
                          controller: controller.usernameController,
                          label: "Username",
                          suffixIcon: FaIcon(
                            FontAwesomeIcons.user,
                            color: ColorsTheme.neutralColor[900],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RegularTextField(
                          controller: controller.emailController,
                          label: "Email",
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: FaIcon(
                            FontAwesomeIcons.envelope,
                            color: ColorsTheme.neutralColor[900],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PasswordTextField(
                            controller: controller.passwordController),
                        const SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            authController.firebaseAuthSignUp(
                              controller.emailController.text,
                              controller.passwordController.text,
                              controller.usernameController.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Center(child: Text("Atau")),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            authController.signInWithGoogle();
                          },
                          icon: const FaIcon(FontAwesomeIcons.google),
                          label: const Text(
                            "Daftar Dengan Google",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Sudah punya akun?"),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.AUTH_SIGN_IN);
                          },
                          child: const Text("Login"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
