
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../static/Colors.dart';
import '../../view/common/toast.dart';
import '../api_service/api_service.dart';
import '../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../view/common/loading_dialog.dart';

class MyQuizScoreController extends GetxController {


  var isDrawerOpen = false.obs;
  var userName="".obs;
  var userToken="".obs;
  var pageNo="1".obs;
  var perPage="10".obs;

  var quizResultList=[].obs;

  @override
  void onInit() {

    loadUserIdFromSharePref();

    ///getStateList();

    getUserScoreResults( token: userToken.value, pageNo: pageNo.value, perPage:perPage.value);

    super.onInit();

  }


  void getUserScoreResults({required String token,required String pageNo,required String perPage}) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //_showToast(token);
        try {
          showLoadingDialog("Loading...");
          var response = await post(

            Uri.parse('${BASE_URL_API}${SUB_URL_API_GET_USER_SCORE_RESULT}'),
            headers: {

              'Authorization': 'Bearer '+token,
              'Accept': 'application/json',
            },
            body: {
              "page_no":pageNo,
              "per_page":perPage
            }
          );


          Get.back();
          if (response.statusCode == 200) {

            var addressResponseData = jsonDecode(response.body);
            quizResultList(addressResponseData["data"]["scores"]);
            showToastShort("account info= "+quizResultList.length.toString());


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

}