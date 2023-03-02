
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../api_service/api_service.dart';
import '../../static/Colors.dart';
import 'package:http/http.dart' as http;
import '../../view/common/loading_dialog.dart';
import '../../view/common/toast.dart';
class ContactUsController extends GetxController {

  ///input box controller
  final userNameController = TextEditingController().obs;
  final userPhoneController = TextEditingController().obs;
  final userEmailController = TextEditingController().obs;

  final subjectController = TextEditingController().obs;
  final messageController = TextEditingController().obs;


  var userEmailLevelTextColor = hint_color.obs;
  var userName="".obs;
  var userToken="".obs;

  var companyName="".obs;
  var telephone="".obs;
  var emailAddress="".obs;
  var cellphone="".obs;
  var address="".obs;

  var faceBookLink="".obs;
  var youtubeLink="".obs;
  var instagramLink="".obs;
  var twitterLink="".obs;




  @override
  void onInit() {
    super.onInit();
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
          // showToastShort("status = ${response.statusCode}");
          Get.back();
          if (response.statusCode == 200) {
            var responseData = jsonDecode(response.body);

            companyName(responseData["data"]["contact"][0]["company_name"].toString());
            telephone(responseData["data"]["contact"][0]["telephone"].toString());
            emailAddress(responseData["data"]["contact"][0]["email"].toString());
            cellphone(responseData["data"]["contact"][0]["cellphone"].toString());
            address(responseData["data"]["contact"][0]["address"].toString());


            faceBookLink(responseData["data"]["contact"][0]["fb"].toString());
            youtubeLink(responseData["data"]["contact"][0]["yt"].toString());
            instagramLink(responseData["data"]["contact"][0]["ins"].toString());
            twitterLink(responseData["data"]["contact"][0]["tw"].toString());


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

  contactUsMessageSend({
    required String name,
    required String email,
    required String message,
    required String subject,
    required String phone,
  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("Sending...");

          var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_CONTACT_US'),

              body: {
                'name': name,
                "phone":phone,
                'email': email,
                "subject":subject,
                'message': message,
              }
          );
          Get.back();
        //  _showToast(response.statusCode.toString());
          if (response.statusCode == 200) {
            showToastShort("Message Send Successfully!");

               userNameController.value.text=""  ;
               userEmailController.value.text=""  ;
           messageController.value.text=""  ;

           subjectController.value.text=""  ;
           userPhoneController.value.text=""  ;
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