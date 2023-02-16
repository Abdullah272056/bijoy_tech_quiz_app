
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../api_service/api_service.dart';
import '../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';
import 'package:http/http.dart' as http;
class QuizStartPageScreenController extends GetxController {

  ///timer variable
  var startTxt = "01:00".obs;
  Timer? timer;
  var otpCountDownSecond = 60.obs;
  // var uid = "09a8a3fb-0c63-49ec-abc4-657132ff8e9f".obs;

  ///question no variable
  var currentQuestionNo="00".obs;
  var totalQuestionNo="00".obs;
  var questionListResponseStatusCode=0.obs;

  var allQuestionSubmit=false.obs;

  var currentTimeUtc="".obs;
  var examEndTimeUtc="".obs;
  /// if 1 then mcq and 2 then short question and 3 question already submit
  var questionType = 0.obs;

  var questionMcqOptionsId="".obs;
  var serverErrorText="".obs;

  var optionList=[].obs;

  var questionName="".obs;
  var questionId="".obs;

  var currentQuestionNumberForSubmit="".obs;
  var currentQuestionNumber="0".obs;
  var totalQuestionNumber="0".obs;



  final shortQuestionNameController = TextEditingController().obs;
  var abcdList=["(a)","(b)","(c)","(d)","(e)","(f)","(g)","(h)"];
  var selectedValue = (-1).obs;
  var selectedAnswer = "".obs;
  var message="If you click 'Skip' or 'Submit' button, You will can not go back previous page.".obs;


  dynamic argumentData = Get.arguments;
  var quizId="".obs;
  var quizTypeStatus="".obs;
  var bookId="".obs;
  var language="".obs;

  var userName="".obs;
  var userToken="".obs;




  @override
  void onInit() {
    super.onInit();

    quizId(argumentData["quizId"].toString());
    quizTypeStatus(argumentData["quizTypeStatus"].toString());
    bookId(argumentData["bookId"].toString());
    language(argumentData["language"].toString());




    loadUserIdFromSharePref();

    getStartQuizData(

        quizId: argumentData["quizId"].toString(),
        status: argumentData["quizTypeStatus"].toString(),
        bookId: argumentData["bookId"].toString(),
        language:argumentData["language"].toString()

    );


   // startTimer(19);
  }
  @override
  void dispose() {
    print('I am disposed');
    timer!.cancel();
    super.dispose();

  }

  void getStartQuizData({
    required String quizId,required String status,
    required String bookId,required String language
  }) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          // showToastShort(quizId);
          // showToastShort(status);
          // showToastShort(bookId);
          // showToastShort(language);

          showLoadingDialog("loading...");

          var response = await post(
              Uri.parse('$BASE_URL_API$SUB_URL_API_GET_START_QUIZ'),
              body: {
                "quiz_id":quizId,
                "status":status,
                "book_id":bookId,
                "lang":language
              },

          );

           showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);
            questionName(dataResponse["data"]["question"]["question"]);
            questionId(dataResponse["data"]["question"]["id"].toString());
            optionList(dataResponse["data"]["question"]["options"]);

            currentQuestionNumberForSubmit(dataResponse["data"]["quesNumber"].toString());
            currentQuestionNumber(dataResponse["data"]["quesNumber"].toString());
            totalQuestionNumber(dataResponse["data"]["total_question"].toString());

            cancelTimer();
            startTimer(19);

            //showToastShort(optionList.length.toString());

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



  void submitQuizData({
    required String quizId,
    required String status,
    required String bookId,
    required String language,
    required String selectedAnswer,
    required String questionId,
    required String quesNumber,
  }) async{
    try {

      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {


          showLoadingDialog("loading...");

          var response = await post(
               Uri.parse('$BASE_URL_API$SUB_URL_API_SUBMIT_QUIZ'),

              body: json.encode({

                "quiz_id": quizId,
                "status": status,
                "book_id": bookId,
                "variation_id": bookId,
                "lang":language,
                "answer": selectedAnswer,
                "questionId": questionId,
                "quesNumber": quesNumber
              }),
              headers: {
                'Content-Type': 'application/json'
              }
          );


          Get.back();
          showToastShort("status = ${response.statusCode}");
          if (response.statusCode == 200) {

          //  var dataResponse = jsonDecode(response.body);
            // questionName(dataResponse["data"]["question"]["question"]);
            // optionList(dataResponse["data"]["question"]["options"]);
            //
            // currentQuestionNumber(dataResponse["data"]["quesNumber"].toString());
            // totalQuestionNumber(dataResponse["data"]["total_question"].toString());
            //
            // cancelTimer();
            // startTimer(19);

            //showToastShort(optionList.length.toString());

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

  @override
  void onClose() {
    // timer!.cancel();
    super.onClose();
    ifTimerMounted();
    print('I am closed');

  }

  ///timer cancel
  ifTimerMounted(){
    final itimer = timer == null ? false : timer!.isActive;
    if(itimer){
      timer!.cancel();
    }else{
      // Or Do Nothing Leave it Blank
      print('Timer Stop Running');
    }
  }

  void cancelTimer(){
    // _showToast("cancel timer");
    timer?.cancel();
    startTxt("00:59");
  }

  void startTimer(var second){
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec, ( timer) {
      if (second <= 0) {
        // if(allQuestionSubmit==false){
        //   showToastLong("time over!");
        //   // Get.off(TimeOverScreen());
        // }
       // showToastLong("time over!");
        startTimer(19);
        // _showToast("Time over!");
        timer.cancel();
      }
      else {
        if(timer.isActive){
          second--;
          startTxt(_printDuration(Duration(seconds: second)));
        }
      }
    },
    );
  }

  /// duration to time format converter
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void selectedValueUpdate(int option){
    selectedValue(option);
  }

  updateQuestionMcqOptionsId(String value) {
    questionMcqOptionsId(value);
  }


}