import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../api_service/api_service.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';
import 'package:http/http.dart' as http;
class EmailVerifyPageController extends GetxController {

  dynamic argumentData = Get.arguments;
  var userEmail="".obs;
  @override
  void onInit() {

   // _showToast(argumentData[0]['email']);
    userEmail(argumentData[0]['email']);

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


  userSendCodeWithEmail({
    required String email,
  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {

          showLoadingDialog("Checking");

          var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_FORGET_PASSWORD'),

              body: {
                'email': email,
              }
          );
          Get.back();
          //  showToastShort(response.statusCode.toString());
          if (response.statusCode == 200) {
            showToastLong("success");
            // var data = jsonDecode(response.body);



          }

          else {
            var data = jsonDecode(response.body);
            showToastShort(data['data']);
          }


        } catch (e) {
          //  Navigator.of(context).pop();
          //print(e.toString());
        } finally {


          /// Navigator.of(context).pop();
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      showToastLong("No Internet Connection!");
    }
  }


}