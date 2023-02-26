
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import '../../api_service/api_service.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';

import '../../static/Colors.dart';
import 'package:http/http.dart' as http;

import '../../view/common/loading_dialog.dart';
import '../../view/common/toast.dart';

class ContactUsController extends GetxController {

  var userName="".obs;
  var userToken="".obs;


  var contactInfoMessage="".obs;

  var faqList=[].obs;
  var faqListExpandedStatusList=[].obs;

  var phoneNumber="".obs;
  var emailAddress="".obs;
  var faxNumber="".obs;
  var address="".obs;


  ///input box controller
  final userNameController = TextEditingController().obs;
  final userEmailController = TextEditingController().obs;
  final messageController = TextEditingController().obs;

  final  userNameControllerFocusNode = FocusNode().obs;
  final  userEmailControllerFocusNode = FocusNode().obs;
  final  messageControllerFocusNode = FocusNode().obs;
  var userEmailLevelTextColor = hint_color.obs;


  @override
  void onInit() {
    super.onInit();
    loadUserIdFromSharePref();
    retriveUserInfo();
   // getPrivacyPolicyData();
    getContactData();

  }





  ///get data api call
  void getContactData() async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("Loading...");
          var response = await get(
            Uri.parse('${BASE_URL_API}${SUB_URL_API_GET_CONTACT_US}'),
          );
         //  _showToast("status = ${response.statusCode}");
          Get.back();
          if (response.statusCode == 200) {
            var responseData = jsonDecode(response.body);


             phoneNumber(responseData["data"]["contact_info"]["phone_number"].toString());
             emailAddress(responseData["data"]["contact_info"]["email"].toString());
             faxNumber(responseData["data"]["contact_info"]["fax"].toString());
             address(responseData["data"]["contact_info"]["address"].toString());
            contactInfoMessage(responseData["data"]["contact_info"]["title"].toString());

            faqList(responseData["data"]["faq"]);

            var n = List.generate(faqList.length+1, (index) => 0);
            faqListExpandedStatusList(n);

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
      // _showToast("qwer "+userToken.toString());
    } catch (e) {

    }

  }

  ///get user data from share pref
  void retriveUserInfo() async {
    try {
      var storage =GetStorage();
      userName(storage.read(pref_user_name).toString());
      userToken(storage.read(pref_user_token).toString());
      //  _showToast("Tokenqw = "+storage.read(pref_user_token).toString());
    }catch(e){

    }

  }


  contactUsMessageSend({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("Sending...");

          var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_CONTACT_US'),

              body: {
                'name': name,
                'email': email,
                'message': message
              }
          );
          Get.back();
        //  _showToast(response.statusCode.toString());
          if (response.statusCode == 200) {
            showToastShort("Message Send Successfully!");

               userNameController.value.text=""  ;
               userEmailController.value.text=""  ;
           messageController.value.text=""  ;
          //  var data = jsonDecode(response.body);


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
      showToastShort("No Internet Connection!");
    }
  }

}