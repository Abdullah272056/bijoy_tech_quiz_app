
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../view/common/toast.dart';

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


}



