
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';

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

  // String t;
  // var selectedDate = DateTime.now().obs;
  // var selectedTime = TimeOfDay.now().obs;

  // void selectDate() async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: Get.context,
  //     initialDate: selectedDate.value,
  //     firstDate: DateTime(2018),
  //     lastDate: DateTime(2025),
  //   );
  //   if (pickedDate != null && pickedDate != selectedDate.value) {
  //     // selectedDate.value = pickedDate;
  //     // textEditingController.text=DateFormat('DD-MM-
  //     //     yyyy').format(selectedDate.value).toString();
  //     }
  //     }


  updateUserNameLevelTextColor(Color value) {
    userEmailLevelTextColor(value);
  }

  updateIsObscureConfirmPassword(var value) {
    isObscureConfirmPassword(value);
  }


  updateIsObscurePassword(var value) {
    isObscurePassword(value);
  }
  updatePasswordLevelTextColor(Color value) {
    passwordLevelTextColor(value);
  }



}