
import 'package:bijoy_tech_quiz_app/view/auth/log_in_page.dart';
import 'package:bijoy_tech_quiz_app/view/auth/registration_page.dart';
import 'package:bijoy_tech_quiz_app/view/drawer/about_us.dart';
import 'package:bijoy_tech_quiz_app/view/drawer/faq.dart';
import 'package:bijoy_tech_quiz_app/view/home_page/profile_section_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'view/home_page/MyQuizScorePage.dart';
import 'view/home_page/dash_board_page.dart';

Future<void> main() async {

  await GetStorage.init();
  runApp( MyApp());
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   // statusBarColor:awsStartColor,
  //   // systemNavigationBarColor:awsEndColor,
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
     home: AboutUsPage()
       //  home: AboutUsPage()
       // home: RegistrationScreen()
       //   home: ProfileSectionPage()
       // home: LogInScreen()
       // home: QuizCategoriesScreen()
    );

  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppLifecycleState changed: $state");
    if (state == AppLifecycleState.resumed) {
      //_showToast("resumed");
    }
  }

}

