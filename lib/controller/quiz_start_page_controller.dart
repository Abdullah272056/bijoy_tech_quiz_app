
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../static/Colors.dart';
import '../../view/common/toast.dart';

class QuizStartPageScreenController extends GetxController {


  ///timer variable
  var startTxt = "00:00:00".obs;
  Timer? timer;
  var otpCountDownSecond = 0.obs;
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

  }

  void selectedValueUpdate(int option){
    selectedValue(option);
  }
  updateQuestionMcqOptionsId(String value) {
    questionMcqOptionsId(value);
  }
}