import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';

class EmailVerifyPageController extends GetxController {

 // dynamic argumentData = Get.arguments;
  var userEmail="".obs;
  @override
  void onInit() {

   // _showToast(argumentData[0]['email']);
   // userEmail(argumentData[0]['email']);

    super.onInit();
  }

  ///input box controller
  double keyboardfontSize= 25;
  double keyboardfontTopPadding= 15;
  double keyboardfontBottomPadding= 15;
  TextStyle keyboardTextStyle= const TextStyle(
      color: textColorWhiteLogin,
      fontSize: 26,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500);
  TextStyle otpInputBoxTextStyle= const TextStyle(
      color: textColor,
      fontSize: 20,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500);


  var inputText="".obs;


  var firstDigitPin="-".obs;
  var secondDigitPin="-".obs;
  var thirdDigitPin="-".obs;
  var fourthDigitPin="-".obs;
  var fifthDigitPin="-".obs;
  var sixthDigitPin="-".obs;



  bool _isCountingStatus=false;
  late Timer _timer;
  String _startTxt = "00:00";

  void startTimer(int second) {
    const oneSec = Duration(seconds: 1);
    // _timer = Timer.periodic(
    //   oneSec,
    //       (Timer timer) {
    //     if (second == 0) {
    //       setState(() {
    //         _isCountingStatus=true;
    //         timer.cancel();
    //       });
    //     } else {
    //       setState(() {
    //         second--;
    //
    //         _startTxt=_printDuration(Duration(seconds: second));
    //       });
    //     }
    //   },
    // );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }


}