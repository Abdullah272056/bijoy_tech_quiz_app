
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
import 'package:http/http.dart';
import '../../../static/Colors.dart';
import '../api_service/api_service.dart';
import '../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../view/common/loading_dialog.dart';
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
    AgeGrade("O-5 grade","1"),
    AgeGrade("6-8 grade","2"),
    AgeGrade("9-12 grade","3"),
    AgeGrade("above/adult","4"),

  ].obs;
  var selectCountryId="".obs;

  var userName="".obs;
  var userToken="".obs;

  var countryDataList = [].obs;
  @override
  void onInit() {

    loadUserIdFromSharePref();

    ///getStateList();
    getCountryDataList();
    getUserAccountDetails(userToken.value);

    super.onInit();

  }

  updateIsObscureConfirmPassword(var value) {
    isObscureConfirmPassword(value);
  }
  updateIsObscurePassword(var value) {
    isObscurePassword(value);
  }



//input text validation check
  inputValid({
        required String userNameTxt, required String userEmailTxt,
        required String userPhoneTxt,
        required String userDateOfBirthTxt,
        required String userAgeGradeTxt,
        required String addressTxt, required String cityTxt,
        required String stateTxt, required String zipCodeTxt,
        required String guardianNameTxt, required String relationWithGuardianTxt,
        required String guardianPhoneTxt,
        required String guardianEmailTxt,
        required String selectedCountryTxt,
      }) {

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

    // if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
    //   //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    // ).hasMatch(guardianEmailTxt)) {
    //   Fluttertoast.cancel();
    //   showToastLong("Enter valid guardian email!");
    //   return;
    // }



    return false;
  }


  void getUserAccountDetails(String token) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //_showToast(token);
        try {
          showLoadingDialog("Loading...");
          var response = await get(

            Uri.parse('${BASE_URL_API}${SUB_URL_API_GET_MY_PROFILE}'),
            headers: {
              'Authorization': 'Bearer '+token,
              // 'Authorization': 'Bearer '+'38|8NS9lFUKzmHJux4R0JRO8hTuMP0Phwrequ5myJ6u',
              'Content-Type': 'application/json',
            },
          );

         showToastShort("account info= "+response.statusCode.toString());
          Get.back();
          if (response.statusCode == 200) {

            var addressResponseData = jsonDecode(response.body);





            if(addressResponseData["data"][0]["name"].toString()!="null"){
              userName(addressResponseData["data"][0]["name"].toString());
              userNameController.value.text =addressResponseData["data"][0]["name"].toString();
              }
            if(addressResponseData["data"][0]["email"].toString()!="null"){
              userEmailController.value.text =addressResponseData["data"][0]["email"].toString();
            }

            if(addressResponseData["data"][0]["phone"].toString()!="null"){
              userPhoneController.value.text = addressResponseData["data"][0]["phone"].toString();
            }
            if(addressResponseData["data"][0]["address"].toString()!="null"){
              userAddressController.value.text =addressResponseData["data"][0]["address"].toString();
            }
            if(addressResponseData["data"][0]["city"].toString()!="null"){
              userCityController.value.text =addressResponseData["data"][0]["city"].toString();
            }




            if(addressResponseData["data"][0]["state"].toString()!="null"){
              userStateController.value.text =addressResponseData["data"][0]["state"].toString();
            }
            if(addressResponseData["data"][0]["zip"].toString()!="null"){
              zipCodeController.value.text =addressResponseData["data"][0]["zip"].toString();
            }

            if(addressResponseData["data"][0]["guardian"].toString()!="null"){
              guardianNameController.value.text =addressResponseData["data"][0]["guardian"].toString();
            }
            if(addressResponseData["data"][0]["guardian_phone"].toString()!="null"){
              guardianPhoneController.value.text =addressResponseData["data"][0]["guardian_phone"].toString();
            }
            if(addressResponseData["data"][0]["guardian_email"].toString()!="null"){
              guardianEmailController.value.text =addressResponseData["data"][0]["guardian_email"].toString();
            }

            if(addressResponseData["data"][0]["relation_with_guardian"].toString()!="null"){
              relationWithGuardianNameController.value.text =addressResponseData["data"][0]["relation_with_guardian"].toString();
            }



            if(addressResponseData["data"][0]["date_of_birth"].toString()!="null"){
              particularBirthDate(addressResponseData["data"][0]["date_of_birth"].toString());
            }


            if(addressResponseData["data"][0]["country"].toString()!="null"){
              selectCountryId(addressResponseData["data"][0]["country"].toString());
            }
            if(addressResponseData["data"][0]["grade"].toString()!="null"){
              selectGradeId(addressResponseData["data"][0]["grade"].toString());
            }










            //


            // // _showToast(selectedState.value);
            // //  stateController.value.text = addressResponseData["data"]["first_name"].toString() ;
            // //  countryController.value.text = addressResponseData["data"]["first_name"].toString() ;
            // zipCodeController.value.text = addressResponseData["data"]["zip_code"];
            //
            // imageLink(addressResponseData["data"]["image"].toString());
            //
            //
            //
            //
            //
            // getCountryList(token);


          }
          else {
            // Fluttertoast.cancel();
            showToastShort("failed try again!");
          }
        } catch (e) {
          // Fluttertoast.cancel();
        }
      }
    } on SocketException {
      Fluttertoast.cancel();
      // _showToast("No Internet Connection!");
    }
  }

  ///get data from share pref
  void loadUserIdFromSharePref() async {
    try {
      var storage =GetStorage();
      userName(storage.read(pref_user_name));
      userToken(storage.read(pref_user_token));
      //_showToast("anbv=  "+storage.read(pref_user_token).toString());
    } catch (e) {
    }
  }

  void getCountryDataList() async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("loading...");

          var response = await get(
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_ALL_COUNTRY_LIST'),
          );
          //showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);

            // productDetailsDataList(dataResponse);
            countryDataList(dataResponse["data"]);

            //  showToastShort(countryDataList.length.toString());

          }
          else {
            // Fluttertoast.cancel();
            showToastShort("failed try again!");
          }
        } catch (e) {
          // Fluttertoast.cancel();
        }
      }
      else{
        showToastShort("No Internet Connection!");

      }
    } on SocketException {
      Fluttertoast.cancel();
      // _showToast("No Internet Connection!");
    }
  }

  void updateUserAccountDetails({
    required String token,
    required String name,
    required String grade,
    required String date_of_birth,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String state,
    required String zip,
    required String country,
    required String guardian,
    required String relationWithGuardian,
    required String guardianPhone,
    required String guardianEmail,
  }) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // _showToast(token);
        try {
          showLoadingDialog("Saving...");
          var response = await post(
              Uri.parse('${BASE_URL_API}${SUB_URL_API_GET_MY_PROFILE_UPDATE}'),
              headers: {
                'Authorization': 'Bearer '+token,
                'Accept': 'application/json',
              },
              body: {
                "name":name,
                "grade":grade,
                "date_of_birth":date_of_birth,
                "email":email,
                "phone":phone,
                "address":address,
                "city":city,
                "state":state,
                "zip":zip,
                "country":country,
                "guardian":guardian,
                "relation_with_guardian":relationWithGuardian,
                "guardian_phone":guardianPhone,
                "guardian_email":guardianEmail
              }
          );

          Get.back();
          showToastShort(response.statusCode.toString());

          if (response.statusCode == 200) {
            showToastShort("Account info update success!");
            getUserAccountDetails(userToken.value);

          }
          else {
            // Fluttertoast.cancel();
            showToastShort("failed try again!");
          }
        } catch (e) {
          showToastShort("catch");
          // Fluttertoast.cancel();
        }
      }
    } on SocketException {
      Fluttertoast.cancel();
      // _showToast("No Internet Connection!");
    }
  }





}

class AgeGrade{
  String gradeName;
  String gradeId;
  AgeGrade(this.gradeName, this.gradeId);
}

