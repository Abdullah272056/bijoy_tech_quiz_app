
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../static/Colors.dart';
import '../../view/common/toast.dart';

class QuizFinishedPageScreenController extends GetxController {


  var wrongAnswer = "0".obs;
  var rightAnswer = "0".obs;
  var totalMarkYouGot = "0.00".obs;
  var aboutQuizText = " ".obs;
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    super.onInit();

    rightAnswer(argumentData["total_right_ans"].toString());
    wrongAnswer(argumentData["total_wrong_ans"].toString());
    totalMarkYouGot(argumentData["total_mark"].toString());


  }



}