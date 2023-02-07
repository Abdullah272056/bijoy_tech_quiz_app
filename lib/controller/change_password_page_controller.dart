
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../view/common/toast.dart';

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
      required String oldPassword,
      required String passwordTxt,
        required String confirmPasswordTxt,

      }
      ) {



    if (oldPassword.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Old password can't empty!");
      return;
    }
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

class AgeGrade{
  String gradeName;
  String gradeId;
  AgeGrade(this.gradeName, this.gradeId);
}

