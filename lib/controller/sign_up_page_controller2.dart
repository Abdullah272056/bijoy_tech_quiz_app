
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../view/common/toast.dart';

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



  var selectCountryId="".obs;
  var countryList = [
    CountryData("Bangladesh","1"),
    CountryData("Pakistan","2"),
    CountryData("India","3"),
    CountryData("Dubai","4"),

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
        required String addressTxt, required String cityTxt,
        required String stateTxt, required String zipCodeTxt,
        required String guardianNameTxt, required String relationWithGuardianTxt,
        required String guardianPhoneTxt,
        required String guardianEmailTxt,
        required String selectedCountryTxt,
      }
      ) {

    if (addressTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Address can't empty!");
      return;
    }

    if (cityTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("City can't empty!");
      return;
    }
    if (stateTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("State can't empty!");
      return;
    }
    if (zipCodeTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Zip code can't empty!");
      return;
    }

    if (selectedCountryTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Country can't empty!");
      return;
    }

    if (guardianNameTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Guardian name can't empty!");
      return;
    }

    if (relationWithGuardianTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Guardian phone can't empty!");
      return;
    }




    if (guardianPhoneTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Guardian phone can't empty!");
      return;
    }
    if (guardianEmailTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Guardian email can't empty!");
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
      //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(guardianEmailTxt)) {
      Fluttertoast.cancel();
      showToastLong("Enter valid email!");
      return;
    }




    return false;
  }


}

class CountryData{
  String countryName;
  String countryId;
  CountryData(this.countryName, this.countryId);
}