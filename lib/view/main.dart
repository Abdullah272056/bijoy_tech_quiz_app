
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:get_storage/get_storage.dart';


import 'auth/email_verification.dart';
import 'auth/fotget_password_page.dart';
import 'auth/log_in_page.dart';
import 'auth/registration_page.dart';
import 'auth/registration_page2.dart';
import 'home_page/dash_board_page.dart';
import 'home_page/general_quiz_details.dart';
import 'home_page/home_page.dart';

void main() {
  GetStorage.init();
  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // statusBarColor:awsStartColor,
    // systemNavigationBarColor:awsEndColor,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      // color: Colors.lime,
      // debugShowCheckedModeBanner: false,

        home: GeneralQuizDetailsPageScreen()

      // home: VendorLogInScreen()
      // VendorSignUpScreen(),
      // CartPage(),
    );

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppLifecycleState changed: $state");
    if (state == AppLifecycleState.resumed) {
      //_showToast("resumed");
    }
  }

}