
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
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




//input text validation check
  inputValid(
      {
        required String paymentMethod, required String accountNumber,
        required String accountName, required String amount,

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



    return false;
  }


}

class PaymentMethodData{
  String paymentmethodName;
  String paymentmethodId;
  PaymentMethodData(this.paymentmethodName, this.paymentmethodId);
}