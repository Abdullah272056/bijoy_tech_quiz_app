
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../view/common/toast.dart';

class MyProfilePageController extends GetxController {

  var isDrawerOpen = false.obs;

  ///input box controller
  final userNameController = TextEditingController().obs;
  final userEmailController = TextEditingController().obs;
  final userPhoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final userAddressController = TextEditingController().obs;
  final userCityController = TextEditingController().obs;
  final userStateController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;
  final guardianNameController = TextEditingController().obs;
  final guardianPhoneController = TextEditingController().obs;
  final guardianEmailController = TextEditingController().obs;
  final relationWithGuardianNameController = TextEditingController().obs;



  final  userNameControllerFocusNode = FocusNode().obs;
  final  userEmailControllerFocusNode = FocusNode().obs;
  final  userPhoneControllerFocusNode = FocusNode().obs;
  final  passwordControllerFocusNode = FocusNode().obs;
  final  confirmPasswordControllerFocusNode = FocusNode().obs;
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


  var selectGradeId="".obs;
  var ageGradeList = [
    AgeGrade("O-5 Grade","1"),
    AgeGrade("6-8 Grade","2"),
    AgeGrade("9-12 Grade","3"),
    AgeGrade("Above/Adult Grade","4"),

  ].obs;
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
        required String userNameTxt, required String userEmailTxt,
        required String userPhoneTxt, required String passwordTxt,
        required String confirmPasswordTxt, required String userDateOfBirthTxt,
        required String userAgeGradeTxt,
        required String addressTxt, required String cityTxt,
        required String stateTxt, required String zipCodeTxt,
        required String guardianNameTxt, required String relationWithGuardianTxt,
        required String guardianPhoneTxt,
        required String guardianEmailTxt,
        required String selectedCountryTxt,
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

class AgeGrade{
  String gradeName;
  String gradeId;
  AgeGrade(this.gradeName, this.gradeId);
}

class CountryData{
  String countryName;
  String countryId;
  CountryData(this.countryName, this.countryId);
}