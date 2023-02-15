
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../static/Colors.dart';
import '../../view/common/toast.dart';

class PdfViewPageScreenController extends GetxController {




  var currentPageNumber=0.obs;
  var totalPageNumber=0.obs;
  var defaultPageNumber=10.obs;

  var pdfLink="".obs;
  var pdfName="".obs;
  dynamic argumentData = Get.arguments;


  // var totalPageNumber=0.obs;

  @override
  void onInit() {
    pdfLink(argumentData["pdfLink"].toString());
    pdfName(argumentData["pdfName"].toString());

    super.onInit();

  }



}