


import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../api_service/api_service.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../../view/common/loading_dialog.dart';
import '../../view/common/toast.dart';

class ReadingIndividualQuizAboutPagePageController extends GetxController {

  var userName="".obs;
  var userToken="".obs;

  var activeBooksList=[].obs;

  var totalQuestion="".obs;
  var everyQuestionMark="".obs;
  var priceMoney="".obs;
  var priceMoneyWillGet="".obs;
  var topEachPersonWillGet="".obs;
  var quizImageLink="".obs;

  dynamic argumentData = Get.arguments;
  var quizId="".obs;
  var quizStatus="".obs;
  var quizName="".obs;

  @override
  void onInit() {
    quizId(argumentData["quizId"].toString());
    quizStatus(argumentData["quizStatus"].toString());
    quizName(argumentData["quizName"].toString());
    loadUserIdFromSharePref();
    getJoinQuizDataList(token: userToken.value,quizId: argumentData["quizId"].toString(), status: argumentData["quizStatus"].toString(), );
    super.onInit();

  }

  void getJoinQuizDataList({required String token,required String quizId,required String status}) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("loading...");

          var response = await post(
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_JOIN_QUIZ'),
              headers: {
                'Authorization': 'Bearer '+token,
                'Accept': 'application/json',
              },
              body: {
                "quiz_id":quizId,
                "status":status
              }
          );
         // showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);


           totalQuestion(dataResponse["data"]["quiz"][0]["total_quistion"].toString());
           everyQuestionMark(dataResponse["data"]["quiz"][0]["mark"].toString());
           priceMoney(dataResponse["data"]["quiz"][0]["price"].toString());
           priceMoneyWillGet(dataResponse["data"]["quiz"][0]["person"].toString());
           topEachPersonWillGet(dataResponse["data"]["quiz"][0]["each_person_get"].toString());


            quizImageLink(dataResponse["data"]["quiz_img"]["img"].toString());



            activeBooksList(dataResponse["data"]["quiz"][0]["active_books"]);

            // productDetailsDataList(dataResponse);
          //  quizCategoriesDataList(dataResponse["data"]);

           //   showToastShort(activeBooksList.length.toString());

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