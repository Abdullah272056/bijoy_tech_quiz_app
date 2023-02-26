
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../static/Colors.dart';
import '../api_service/api_service.dart';
import '../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';
import 'package:http/http.dart' as http;

class ChangePasswordPageController extends GetxController {



  ///input box controller

  final oldPasswordController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final  passwordOldControllerFocusNode = FocusNode().obs;
  final  passwordControllerFocusNode = FocusNode().obs;
  final  confirmPasswordControllerFocusNode = FocusNode().obs;


  ///input box color and operation
  var userEmailLevelTextColor = hint_color.obs;
  var passwordLevelTextColor = hint_color.obs;
  var emailFocusNode = FocusNode().obs;
  var isObscureOldPassword = true.obs;
  var isObscurePassword = true.obs;
  var isObscureConfirmPassword = true.obs;

  var particularBirthDate="Enter Birthday".obs;
  var select_your_country="Enter Birthday".obs;

  var userName="".obs;
  var userToken="".obs;

  @override
  void onInit() {
    loadUserIdFromSharePref();
    super.onInit();

  }

  updateIsObscureConfirmPassword(var value) {
    isObscureConfirmPassword(value);
  }
  updateIsObscurePassword(var value) {
    isObscurePassword(value);
  }
  updateIsObscureOldPassword(var value) {
    isObscureOldPassword(value);
  }



//input text validation check
  inputValid(
      {

      required String passwordTxt,
        required String confirmPasswordTxt,

      }
      ) {

    if (passwordTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Password can't empty!");
      return;
    }
    if (passwordTxt.length < 6) {
      Fluttertoast.cancel();
      showToastLong("Password must be 6 character!");
      return;
    }
    if (passwordTxt.length >= 15) {
      Fluttertoast.cancel();
      showToastLong("Password must be less than 15 character!");
      return;
    }

    if (passwordTxt!=confirmPasswordTxt) {
      Fluttertoast.cancel();
      showToastLong("Confirm Password not match!");
      return;
    }


    return false;
  }

  ///get data from share pref
  void loadUserIdFromSharePref() async {
    try {
      var storage =GetStorage();


      userName(storage.read(pref_user_name));
      userToken(storage.read(pref_user_token));
    } catch (e) {

    }

  }
  passwordChange({
    required String password,
    required String confirmPassword,
    required String userToken,
  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("Checking...");

          var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_GET_PASSWORD_CHANGE'),
              headers: {
                'Authorization': 'Bearer '+userToken,
                'Accept': 'application/json',
              },
              body: {
                'password': password,
                'password_confirmation': confirmPassword,
              }
          );

         // showToastShort(response.statusCode.toString());

          Get.back();
          if (response.statusCode == 200) {

            var data = jsonDecode(response.body);
            showToastShort(data["message"].toString());

          }

          else {
            var data = jsonDecode(response.body);
            showToastShort(data['Failed try again!']);
          }
          //   Get.back();

        } catch (e) {
          //  Navigator.of(context).pop();
          //print(e.toString());
        } finally {
          //   Get.back();

          /// Navigator.of(context).pop();
        }
      }
    } on SocketException catch (_) {

      Fluttertoast.cancel();
      showToastShort("No Internet Connection!");
    }
  }


}

class AgeGrade{
  String gradeName;
  String gradeId;
  AgeGrade(this.gradeName, this.gradeId);
}

