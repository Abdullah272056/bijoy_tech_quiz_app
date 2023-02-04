
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';

class SignUpPageController2 extends GetxController {



  ///input box controller
  final userAddressController = TextEditingController().obs;
  final userCityController = TextEditingController().obs;
  final userStateController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;
  final guardianNameController = TextEditingController().obs;
  final guardianPhoneController = TextEditingController().obs;
  final guardianEmailController = TextEditingController().obs;
  final relationWithGuardianNameController = TextEditingController().obs;


  final  userAddressControllerFocusNode = FocusNode().obs;
  final  userCityControllerFocusNode = FocusNode().obs;
  final  userStateControllerFocusNode = FocusNode().obs;
  final  zipCodeControllerFocusNode = FocusNode().obs;
  final  guardianNameControllerFocusNode = FocusNode().obs;
  final  guardianPhoneControllerFocusNode = FocusNode().obs;
  final  guardianEmailControllerFocusNode = FocusNode().obs;
  final  relationWithGuardianNameControllerFocusNode = FocusNode().obs;



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