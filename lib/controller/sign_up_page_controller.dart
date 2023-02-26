

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../static/Colors.dart';
import '../api_service/api_service.dart';
import '../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';
import '../view/home_page/dash_board_page.dart';
import 'change_password_page_controller.dart';
import 'dash_board_page_controller.dart';

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

  var userBirthDate="Enter Birthday".obs;
  var select_your_birth_day="Enter Birthday".obs;


  var selectGradeId="".obs;
  var ageGradeList = [
    AgeGrade("O-5 grade","1"),
    AgeGrade("6-8 grade","2"),
    AgeGrade("9-12 grade","3"),
    AgeGrade("above/adult","4"),
  ].obs;

  var selectGradeText="".obs;


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

  var selectCountryId="".obs;

  var countryDataList = [].obs;


  @override
  void onInit() {


    getCountryDataList();


    super.onInit();
  }

  void getCountryDataList() async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          //showLoadingDialog("loading...");

          var response = await get(
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_ALL_COUNTRY_LIST'),
          );
          //showToastShort("status = ${response.statusCode}");
          //  Get.back();

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

    if (userDateOfBirthTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Select date Of birth!");
      return;
    }
    if (userDateOfBirthTxt==select_your_birth_day.value) {
      Fluttertoast.cancel();
      showToastLong("Select date Of birth!");
      return;
    }
    if (userAgeGradeTxt.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Select age Grade!");
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

    //guardian

    if(userAgeGradeTxt!="above/adult".toString()){

      if (guardianNameTxt.isEmpty) {
        Fluttertoast.cancel();
        showToastLong("Guardian name can't empty!");
        return;
      }

      if (relationWithGuardianTxt.isEmpty) {
        Fluttertoast.cancel();
        showToastLong("Guardian relation can't empty!");
        return;
      }

      if (guardianPhoneTxt.isEmpty) {
        Fluttertoast.cancel();
        showToastLong("Guardian phone can't empty!");
        return;
      }
      // if (guardianEmailTxt.isEmpty) {
      //   Fluttertoast.cancel();
      //   showToastLong("Guardian email can't empty!");
      //   return;
      // }
      //
      // if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
      //   //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
      // ).hasMatch(guardianEmailTxt)) {
      //   Fluttertoast.cancel();
      //   showToastLong("Enter valid email!");
      //   return;
      // }

    }







    return false;
  }


  userSignUp({
    required String name,
    required String grade,
    required String date_of_birth,
    required String email,
    required String phone,
    required String password,
    required String address,
    required String city,
    required String state,
    required String zip,
    required String country,
    required String guardian,
    required String relationWithGuardian,
    required String guardianPhone,
    required String guardianEmail,

  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("Checking");

          var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_SIGN_UP'),

              body: {
                "name":name,
                "grade":grade,
                "date_of_birth":date_of_birth,
                "email":email,
                "phone":phone,
                "password":password,
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
            // _showToast("success");
            var data = jsonDecode(response.body);
            saveUserInfo(
                userName: data["data"]["name"].toString(),
                userToken: data["data"]["token"].toString());

            Get.deleteAll();
            Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());

          }
          else if (response.statusCode == 404) {
            var data = jsonDecode(response.body);
            if(data["message"]["name"]!=null){
              showToastLong(data["message"]["name"][0].toString());
              return;
            }

            if(data["message"]["email"]!=null){
              showToastLong(data["message"]["email"][0].toString());
              return;
            }

            if(data["message"]["password"]!=null){
              showToastLong(data["message"]["password"][0].toString());
              return;
            }

          }
          else {

            var data = jsonDecode(response.body);
            //_showToast(data['message']);
          }


        } catch (e) {
          //  Navigator.of(context).pop();
          //print(e.toString());
        } finally {

          /// Navigator.of(context).pop();
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      showToastLong("No Internet Connection!");
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

class CountryData{
  String countryName;
  String countryId;
  CountryData(this.countryName, this.countryId);
}
class AgeGrade{
  String gradeName;
  String gradeId;
  AgeGrade(this.gradeName, this.gradeId);
}

