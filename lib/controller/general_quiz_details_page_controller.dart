
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../view/common/toast.dart';

class GeneralQuizDetailsPageController extends GetxController {

  var textValue = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
      "the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type "
      "and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into"
      " electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of "
      "Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus "
      "PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting "
      "industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer "
      "took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but "
      "also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with "
      "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software"
      " like Aldus PageMaker including versions of Lorem Ipsum".obs;




  //loading dialog crete
  void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        // return VerificationScreen();
        return Dialog(
          child: Wrap(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 20),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const CircularProgressIndicator(
                          backgroundColor: awsStartColor,
                          color: awsEndColor,
                          strokeWidth: 5,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          message,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ))
            ],
            // child: VerificationScreen(),
          ),
        );
      },
    );
  }

}