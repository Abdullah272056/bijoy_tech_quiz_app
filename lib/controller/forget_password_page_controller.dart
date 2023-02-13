
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../static/Colors.dart';
import '../api_service/api_service.dart';
import '../view/auth/email_verification.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';
import 'package:http/http.dart' as http;
class ForgetPasswordPageController extends GetxController {
  final emailController = TextEditingController().obs;
  var userNameLevelTextColor = levelTextColorWhite.obs;

  sendEmailForOtp({
    required String email,
  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("Checking");

          var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_FORGET_PASSWORD'),

              body: {
                'email': email,
              }
          );
          Get.back();
        //  showToastShort(response.statusCode.toString());
          if (response.statusCode == 200) {
            showToastLong("success");
            // var data = jsonDecode(response.body);


            // Get.to(SignUpScreen());

            Get.to(() => EmailVerificationScreen(), arguments: [
              {"email": email},
              {"second": 'Second'}
            ]);


          }

          else {
            var data = jsonDecode(response.body);
             showToastShort(data['data']);
          }


        } catch (e) {
          //  Navigator.of(context).pop();
          //print(e.toString());
        } finally {


          /// Navigator.of(context).pop();
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      showToastLong("No Internet Connection!");
    }
  }

  inputValid(String email) {
    if (email.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("E-mail can't empty!");
      return;
    }
    if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      Fluttertoast.cancel();
      showToastLong("Enter valid email!");
      return;
    }
    return false;
  }

}