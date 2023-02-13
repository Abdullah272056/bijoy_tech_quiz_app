
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../static/Colors.dart';
import '../../view/common/toast.dart';
import '../api_service/api_service.dart';
import '../view/common/loading_dialog.dart';

class HomeController extends GetxController {


  var isDrawerOpen = false.obs;

  var quizDataList = [].obs;


  @override
  void onInit() {

    getQuizDataList();
    super.onInit();

  }

  void getQuizDataList() async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("loading...");

          var response = await get(
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_HOME_PAGE_ALL_QUIZ'),
          );
           //  showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);

             quizDataList(dataResponse["data"]);

             //showToastShort(quizDataList.length.toString());

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