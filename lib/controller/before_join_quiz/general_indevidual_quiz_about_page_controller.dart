
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../api_service/api_service.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../../static/Colors.dart';
import '../../view/common/loading_dialog.dart';
import '../../view/common/toast.dart';

class GeneralIndividualQuizAboutPagePageController extends GetxController {



  var aboutQuizText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
      "the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type "
      "industry. ".obs;

  var userName="".obs;
  var userToken="".obs;

  var activeBooksList=[].obs;

  var quizTitle="".obs;
  var quizDescription="".obs;



  var totalQuestion="".obs;
  var everyQuestionMark="".obs;
  var priceMoney="".obs;
  var priceMoneyWillGet="".obs;
  var topEachPersonWillGet="".obs;
  var quizImageLink="".obs;

  var activeBangla="0".obs;
  var activeEnglish="0".obs;

  @override
  void onInit() {
    loadUserIdFromSharePref();
    getJoinQuizDataList(quizId: '66', status: '1');
    super.onInit();

  }

  void getJoinQuizDataList({required String quizId,required String status}) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("loading...");

          var response = await post(
              Uri.parse('$BASE_URL_API$SUB_URL_API_GET_JOIN_QUIZ'),
              body: {
                "quiz_id":quizId,
                "status":status
              }
          );

          showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);

            totalQuestion(dataResponse["data"]["quiz"][0]["total_quistion"].toString());
            everyQuestionMark(dataResponse["data"]["quiz"][0]["mark"].toString());
            priceMoney(dataResponse["data"]["quiz"][0]["price"].toString());
            priceMoneyWillGet(dataResponse["data"]["quiz"][0]["person"].toString());
            topEachPersonWillGet(dataResponse["data"]["quiz"][0]["each_person_get"].toString());


            quizImageLink(dataResponse["data"]["quiz_img"]["img"].toString());
            quizTitle(dataResponse["data"]["quiz"][0]["title"].toString());
            quizDescription(dataResponse["data"]["quiz"][0]["description"].toString());



            activeBangla(dataResponse["data"]["quiz"][0]["active_bangla"].toString());
            activeEnglish(dataResponse["data"]["quiz"][0]["active_english"].toString());



            activeBooksList(dataResponse["data"]["quiz"][0]["active_books"]);

            // productDetailsDataList(dataResponse);
            //  quizCategoriesDataList(dataResponse["data"]);

            showToastShort(activeBooksList.length.toString());

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
  void loadUserIdFromSharePref() async {
    try {
      var storage =GetStorage();
      userName(storage.read(pref_user_name));
      userToken(storage.read(pref_user_token));
    } catch (e) {

    }

  }


}