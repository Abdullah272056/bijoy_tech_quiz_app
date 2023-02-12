
import 'dart:convert';
import 'dart:io';


import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../api_service/api_service.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';

class CategoriesQuizDetailsPageController extends GetxController {


  var categoriesId="3".obs;


  var quizName="".obs;
  var quizAboutText="".obs;
  var onGoingQuizList= [].obs;
  var recentlyFinishedQuizList= [].obs;

  @override
  void onInit() {
    getQuizCategoriesDetailsDataList();
    super.onInit();

  }

  void getQuizCategoriesDetailsDataList() async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("loading...");

          var response = await get(
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_HOME_CATEGORIES_QUIZ_DETAILS$categoriesId'),
          );
            showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);



            quizName(dataResponse["data"]["content"]["title"].toString());
            quizAboutText(dataResponse["data"]["content"]["content"].toString());
             //
             onGoingQuizList(dataResponse["data"]["ongoing"]);
            recentlyFinishedQuizList(dataResponse["data"]["quizes"]);
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



}