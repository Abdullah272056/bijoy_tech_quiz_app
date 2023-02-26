
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
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

class PaymentRequestPageController extends GetxController {



  ///input box controller
  final userAddressController = TextEditingController().obs;

  final accountNumberController = TextEditingController().obs;
  final accountNameController = TextEditingController().obs;
  final amountController = TextEditingController().obs;
  final noteController = TextEditingController().obs;



  final  userAddressControllerFocusNode = FocusNode().obs;




  ///input box color and operation
  var userEmailLevelTextColor = hint_color.obs;
  var passwordLevelTextColor = hint_color.obs;
  var emailFocusNode = FocusNode().obs;




  var selectPaymentMethodId="".obs;
  var paymentMethodList = [
    PaymentMethodData("bKash","1"),
    PaymentMethodData("Nogod","2"),


  ].obs;

  var userName="".obs;
  var userToken="".obs;

  @override
  void onInit() {
    super.onInit();


    loadUserIdFromSharePref();

    // getStartQuizData(
    //     quizId: argumentData["quizId"].toString(),
    //     status: argumentData["quizTypeStatus"].toString(),
    //     bookId: argumentData["bookId"].toString(),
    //     language:argumentData["language"].toString(), token: userToken.value
    // );


    //  startTimer(19);
  }




  void paymentRequest({
    required String token,
    required String payment_method
    ,required String account_number,
    required String account_name,
    required String amount,
    required String note,
  }) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("loading...");

          var response = await post(
            Uri.parse('$BASE_URL_API$SUB_URL_API_PAYMENT_REQUEST'),
            headers: {
              'Authorization': 'Bearer '+token,
              'Accept': 'application/json',
            },
            body: {
              "payment_method" : payment_method,
              "account_number" : account_number,
              "account_name": account_name,
              "amount":amount,
              "note":note
            },

          );

          // showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);
            showToastShort("Payment Request Successfully!");
          }
          else if(response.statusCode == 402){
            showToastLong("Insufficient Balance!");

          }

          else {

            // Fluttertoast.cancel();
             showToastShort("Failed try again!");
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


//input text validation check
  inputValid(
      {
        required String paymentMethod, required String accountNumber,
        required String accountName, required String amount,
        required String note,
      }
      ) {

    if (paymentMethod.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Payment method can't empty!");
      return;
    }
    if (accountNumber.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Account number can't empty!");
      return;
    }
    if (accountName.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Account name can't empty!");
      return;
    }
    if (amount.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("Amount can't empty!");
      return;
    }
    if (note.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("note can't empty!");
      return;
    }



    return false;
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

class PaymentMethodData{
  String paymentmethodName;
  String paymentmethodId;
  PaymentMethodData(this.paymentmethodName, this.paymentmethodId);
}