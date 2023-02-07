
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../view/common/toast.dart';

class SignUpPageController extends GetxController {



  ///input box controller
  final userNameController = TextEditingController().obs;
  final userEmailController = TextEditingController().obs;
  final userPhoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final  userNameControllerFocusNode = FocusNode().obs;
  final  userEmailControllerFocusNode = FocusNode().obs;
  final  userPhoneControllerFocusNode = FocusNode().obs;
  final  passwordControllerFocusNode = FocusNode().obs;
  final  confirmPasswordControllerFocusNode = FocusNode().obs;


  ///input box color and operation
  var userEmailLevelTextColor = hint_color.obs;
  var passwordLevelTextColor = hint_color.obs;
  var emailFocusNode = FocusNode().obs;
  var isObscurePassword = true.obs;
  var isObscureConfirmPassword = true.obs;

  var particularBirthDate="Enter Birthday".obs;
  var select_your_country="Enter Birthday".obs;


  var selectGradeId="".obs;
  var ageGradeList = [
    AgeGrade("O-5 Grade","1"),
    AgeGrade("6-8 Grade","2"),
    AgeGrade("9-12 Grade","3"),
    AgeGrade("Above/Adult Grade","4"),

  ].obs;


  updateIsObscureConfirmPassword(var value) {
    isObscureConfirmPassword(value);
  }
  updateIsObscurePassword(var value) {
    isObscurePassword(value);
  }



//input text validation check
  inputValid(
      {
        required String userNameTxt, required String userEmailTxt,
        required String userPhoneTxt, required String passwordTxt,
        required String confirmPasswordTxt, required String userDateOfBirthTxt,
        required String userAgeGradeTxt
      }
      ) {

    if (userNameTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Full name can't empty!");
      return;
    }
    if (userEmailTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Email can't empty!");
      return;
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
      //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(userEmailTxt)) {
      Fluttertoast.cancel();
      showToastLong("Enter valid email!");
      return;
    }
    if (userPhoneTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Phone can't empty!");
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
    } if (passwordTxt!=confirmPasswordTxt) {
      Fluttertoast.cancel();
      showToastLong("Confirm Password not match!");
      return;
    }

    if (userDateOfBirthTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Select date Of birth!");
      return;
    }
    if (userAgeGradeTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Select age Grade!");
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

