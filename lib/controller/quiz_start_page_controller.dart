
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/common/toast.dart';
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

  //dynamic
  var studentId = "".obs;
  var hwPaneQuizId="".obs;
  var hw_panel_id = "".obs;
  var hw_panel_uid = "".obs;


  final shortQuestionNameController = TextEditingController().obs;
  var abcdList=["(a)","(b)","(c)","(d)","(e)","(f)","(g)","(h)"];
  var selectedValue = (-1).obs;
  var message="If you click 'Skip' or 'Submit' button, You will can not go back previous page.".obs;

  void ref(){
    onInit();
  }

  @override
  void onInit() {
    super.onInit();
    startTimer(19);
  }
  @override
  void dispose() {
    print('I am disposed');
    timer!.cancel();
    super.dispose();

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
        showToastLong("time over!");
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