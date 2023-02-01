
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() {

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
        home: Container(

          color: Colors.yellowAccent,
        )

        // DashBoardPageScreen(
        //
        // )

    );

  }




}