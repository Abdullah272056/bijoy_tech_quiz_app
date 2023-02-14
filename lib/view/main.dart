
import 'package:bijoy_tech_quiz_app/view/pdf_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import '../quiz_start_page.dart';
import 'auth/log_in_page.dart';
import 'auth/registration_page.dart';
import 'auth/registration_page2.dart';
import 'before_join_quiz/reading_indevidual_quiz_about_more.dart';
import 'categories_quiz_details.dart';
import 'custom_drawer.dart';
import 'home_page/categories_wise_quiz_list_page.dart';
import 'home_page/dash_board_page.dart';
import 'home_page/general_quiz_details.dart';
import 'home_page/quiz_categories_page.dart';
import 'home_page/recently_finished_quiz_list_page.dart';
import 'home_page/home_page.dart';
import 'before_join_quiz/individual_quiz_about_more.dart';

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
      // home: DashBoardPageScreen()
      home: QuizCategoriesScreen()

    );

  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppLifecycleState changed: $state");
    if (state == AppLifecycleState.resumed) {
      //_showToast("resumed");
    }
  }

}

