import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:tsa_firebase_auth/app/modules/auth/controllers/auth_controller.dart';
import 'package:tsa_firebase_auth/app/modules/global/themes/color_theme.dart';
import 'package:tsa_firebase_auth/app/modules/global/themes/typography_theme.dart';
import 'package:tsa_firebase_auth/app/modules/global/widgets/drawer/main_drawer_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  AuthController authController = Get.find<AuthController>();
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang",
              style: TypographyTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        user?.photoURL ?? "https://picsum.photos/159"),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${user?.displayName != null ? user?.displayName : "User"}",
              style: TypographyTheme.titleSmall,
            ),
            const SizedBox(height: 16),
            Text("Email kamu :  ${user?.email}"),
            const SizedBox(height: 8),
            Text("UID kamu : ${user?.uid}"),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
