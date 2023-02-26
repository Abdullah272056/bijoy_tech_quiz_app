
import 'dart:convert';
import 'dart:io';

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

class QuizAboutPageController extends GetxController {

  var textValue = "".obs;

  var categoriesId="3".obs;
  var imageUrl="".obs;

  var categoriesDataResponse;


  var quizTypeStatus="".obs;


  var quizName="".obs;
  var titleName="".obs;
  var quizId="".obs;

  var quizAboutText="".obs;
  var onGoingQuizList= [].obs;
  var recentlyFinishedQuizList= [].obs;

  var userName="".obs;
  var userToken="".obs;

  dynamic argumentData = Get.arguments;




  @override
  void onInit() {
    // categoriesDataResponse=argumentData['categoriesDataResponse'].toString();
    // showToastShort(argumentData["categoriesId"].toString());
    titleName(argumentData["categoriesQuizName"].toString());
    imageUrl(argumentData["categoriesImg"].toString());
    quizId(argumentData["categoriesId"].toString());
    loadUserIdFromSharePref();
    getQuizCategoriesDetailsDataList(argumentData["categoriesId"].toString() );



    super.onInit();

  }

  void getQuizCategoriesDetailsDataList(String categories_id ) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("loading...");

          var response = await get(
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_HOME_CATEGORIES_QUIZ_DETAILS$categories_id'),
          );
          //   showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);



            quizName(dataResponse["data"]["content"][0]["title"].toString());
            quizAboutText(dataResponse["data"]["content"][0]["content"].toString());
            textValue(dataResponse["data"]["content"][0]["content"].toString());
            //
            onGoingQuizList(dataResponse["data"]["ongoing"]);
            recentlyFinishedQuizList(dataResponse["data"]["quizes"]);


            quizTypeStatus(dataResponse["data"]["content"][0]["status"].toString());



            imageUrl(BASE_URL_HOME_IMAGE+dataResponse["data"]["content"][0]["img"].toString());

            // recentlyFinishedQuizList="".obs;

            // productDetailsDataList(dataResponse);
            //   quizCategoriesDataList(dataResponse["data"]);

            //  showToastShort(onGoingQuizList.length.toString());

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