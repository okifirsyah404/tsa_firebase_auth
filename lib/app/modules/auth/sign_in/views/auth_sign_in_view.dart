import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:tsa_firebase_auth/app/modules/auth/controllers/auth_controller.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/themes/color_theme.dart';
import '../../../global/themes/typography_theme.dart';
import '../../../global/widgets/text_field/password_text_field/password_text_field.dart';
import '../../../global/widgets/text_field/regular_text_field/regular_text_field.dart';
import '../controllers/auth_sign_in_controller.dart';

class AuthSignInView extends GetView<AuthSignInController> {
  AuthSignInView({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();

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
                          "Login",
                          style: TypographyTheme.headlineMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: ColorsTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Silahkan login untuk melanjutkan",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RegularTextField(
                          controller: controller.emailController,
                          label: "Email",
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
                            authController.firebaseAuthLogin(
                                controller.emailController.text,
                                controller.passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text(
                            "Login",
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
                            "Masuk Dengan Google",
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
                        const Text("Belum punya akun?"),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.AUTH_SIGN_UP);
                          },
                          child: const Text("Daftar"),
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
