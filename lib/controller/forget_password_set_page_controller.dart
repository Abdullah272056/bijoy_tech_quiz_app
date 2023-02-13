
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../api_service/api_service.dart';
import '../view/auth/log_in_page.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';
import 'package:http/http.dart' as http;
class ForgetPasswordSetPageController extends GetxController {

  ///input box controller
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;


  ///input box color and operation
  var userEmailLevelTextColor = hint_color.obs;
  var passwordLevelTextColor = hint_color.obs;


  var isObscurePassword = true.obs;
  var isObscureConfirmPassword = true.obs;


  dynamic argumentData = Get.arguments;
  var userEmail="".obs;
  var useOtp="".obs;
  @override
  void onInit() {
    userEmail(argumentData[0]['email']);
    useOtp(argumentData[1]['otp'].toString());
    // _showToast(argumentData[0]['email']);
    // _showToast(argumentData[1]['otp'].toString());

    super.onInit();
  }


  updateIsObscureConfirmPassword(var value) {
    isObscureConfirmPassword(value);
  }
  updateIsObscurePassword(var value) {
    isObscurePassword(value);
  }




//input text validation check
  inputValid(
      {required String passwordTxt,
      required String confirmPasswordTxt,}) {
    if (passwordTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Password can't empty!");
      return;
    }
    if (passwordTxt.length < 8) {
      Fluttertoast.cancel();
      showToastLong("Password must be 8 character!");
      return;
    }
    if (passwordTxt!=confirmPasswordTxt) {
      Fluttertoast.cancel();
      showToastLong("Confirm Password not match!");
      return;
    }


    return false;
  }


  // new password set api call
  newPassword({
    required String otp,
    required String email,
    required String password,
  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("Checking");

          var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_SET_NEW_PASSWORD'),

              body: {
                'otp': otp,
                'email': email,
                'password': password
              }
          );
          Get.back();
          // _showToast(response.statusCode.toString());
          if (response.statusCode == 200) {
            showToastShort("Successfully Save New Password!");
            var data = jsonDecode(response.body);
            Get.to(LogInScreen());

          }

          else {

            var data = jsonDecode(response.body);
            showToastLong(data['data']);
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

}



