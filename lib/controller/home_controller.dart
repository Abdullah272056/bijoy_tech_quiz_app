
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

class HomeController extends GetxController {

  var isDrawerOpen = false.obs;
  var quizDataList = [].obs;
  var userName="".obs;
  var userToken="".obs;

  // final box = GetStorage();


  // HomeController() {
  //   loadUserIdFromSharePref();
  // }


  @override
  void onInit() {


   loadUserIdFromSharePref();
  getQuizDataList("");

    super.onInit();

  }

  void getQuizDataList(String token) async{
    try {
      final result = await InternetAddress.lookup('example.com');
     // final data = box.read("com.fnf_ecommerce.fnf_ecommerce.preference_file.pref_user_token");
     // showToastShort(data.toString());
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("loading...");

          var response = await get(
            // Uri.parse('$BASE_URL_API$SUB_URL_API_GET_HOME_PAGE_ALL_QUIZ'),
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_ONGOING_ALL_QUIZ'),
            // headers: {
            //  'Authorization': 'Bearer '+token,
            //   'Accept': 'application/json',
            // },
          );
         //    showToastShort("status home= ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);

             quizDataList(dataResponse["data"]);

             //showToastShort(quizDataList.length.toString());

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

  ///get data from share pref
  ///get data from share pref
  void loadUserIdFromSharePref() async {
    try {

      var storage =GetStorage();
      userName(storage.read(pref_user_name));
      userToken(storage.read(pref_user_token));
      // if(
      // userToken.value!=""&&
      // userToken.value!="null"&&
      // userToken.value!=null
      // ){
      //   getQuizDataList(userToken.value);
      //
      // }



    } catch (e) {

    }

  }




}