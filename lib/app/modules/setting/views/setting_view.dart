import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tsa_firebase_auth/app/modules/global/themes/color_theme.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(
            () => ListTile(
              title: Text("Ubah Tema ke Gelap"),
              trailing: Switch(
                onChanged: (value) {
                  controller.toggleDarkMode();
                },
                activeColor: ColorsTheme.primaryColor,
                activeTrackColor: ColorsTheme.primaryColor[300],
                value: controller.isDarkMode.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
