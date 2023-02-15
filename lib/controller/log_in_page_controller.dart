
import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../api_service/api_service.dart';
import '../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';
import '../view/home_page/dash_board_page.dart';
import 'dash_board_page_controller.dart';

class LogInPageController extends GetxController {

  ///input box controller
  final userEmailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final  userEmailControllerFocusNode = FocusNode().obs;
  final  passwordControllerFocusNode = FocusNode().obs;

  ///input box color and operation
  var userEmailLevelTextColor = levelTextColorWhite.obs;
  var passwordLevelTextColor = levelTextColorWhite.obs;
  var emailFocusNode = FocusNode().obs;
  var isObscure = true.obs;

  updateUserNameLevelTextColor(Color value) {
    userEmailLevelTextColor(value);
  }

  updateIsObscure(var value) {
    isObscure(value);
  }
  updatePasswordLevelTextColor(Color value) {
    passwordLevelTextColor(value);
  }

  //input text validation check
  inputValid(String userEmail, String password) {
    if (userEmail.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Email can't empty!");
      return;
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
      //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    )
        .hasMatch(userEmail)) {
      Fluttertoast.cancel();
      showToastLong("Enter valid email!");
      return;
    }
    if (password.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Password can't empty!");
      return;
    }
    if (password.length < 8) {
      Fluttertoast.cancel();
      showToastLong("Password must be 8 character!");
      return;
    }

    return false;
  }

  userLogIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("Checking...");

          var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_LOG_IN'),

              body: {
                'email': email,
                'password': password,
              }
          );

          // _showToast(response.statusCode.toString());

          Get.back();
          if (response.statusCode == 200) {
            showToastShort("success");

            var data = jsonDecode(response.body);
            saveUserInfo(
                userName: data["data"]["name"].toString(),
                userToken: data["data"]["token"].toString());
            //
             Get.deleteAll();
             Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());

          }
          else if (response.statusCode == 401) {
            showToastShort("User name or password not match!");
          }
          else {
            var data = jsonDecode(response.body);
            // _showToast(data['message']);
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


  ///user info with share pref
  void saveUserInfo({required String userName,required String userToken,}) async {
    try {
      var storage =GetStorage();
      storage.write(pref_user_name, userName);
      storage.write(pref_user_token, userToken);
      storage.write(pref_user_type, "user");
      // _showToast(userToken.toString());
    } catch (e) {
      //code
    }
  }


}