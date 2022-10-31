import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tsa_firebase_auth/app/modules/auth/controllers/auth_controller.dart';
import 'package:tsa_firebase_auth/app/routes/app_pages.dart';

import '../../themes/color_theme.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key});

  final AuthController authController = Get.find<AuthController>();
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsTheme.neutralColor[800],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
                user?.displayName ?? "Anonymous"),
            accountEmail: Text("${user?.email}"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  NetworkImage(user?.photoURL ?? "https://picsum.photos/100"),
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.house,
              color: ColorsTheme.neutralColor[50],
            ),
            title: const Text('Beranda'),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.HOME);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.mapLocation,
              color: ColorsTheme.neutralColor[50],
            ),
            title: const Text('Map'),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.GEO_LOCATION);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: ColorsTheme.neutralColor[200],
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.gear,
              color: ColorsTheme.neutralColor[50],
            ),
            title: const Text('Setting'),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.SETTING);
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: ColorsTheme.neutralColor[50],
            ),
            title: const Text('Keluar'),
            onTap: () {
              authController.firebaseAuthSignOut();
            },
          ),

        ],
      ),
    );
  }
}
