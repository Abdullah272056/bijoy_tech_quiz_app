
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../static/Colors.dart';
import '../../view/common/toast.dart';

class QuizFinishedPageScreenController extends GetxController {


  var wrongAnswer = "1".obs;
  var rightAnswer = "9".obs;
  var totalMarkYouGot = "90.00".obs;
  var aboutQuizText = " ".obs;

  void ref(){
    onInit();
  }
  @override
  void onInit() {


    super.onInit();

  }



}