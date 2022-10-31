import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/modules/global/themes/main_theme_data.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final AuthController authController =
      Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(
      stream: authController.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(

            title: "TSA Polije",
            debugShowCheckedModeBanner: false,
            theme: MainThemeData.mainThemeData(context),
            initialRoute: snapshot.data != null ? Routes.HOME : Routes.AUTH_SIGN_IN,
            getPages: AppPages.routes,
          );
        }
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
