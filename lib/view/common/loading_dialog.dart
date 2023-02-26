import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../static/Colors.dart';

void showLoadingDialog(String message) {

  Get.defaultDialog(
      title: '',
      titleStyle: TextStyle(fontSize: 0),
      // backgroundColor: Colors.white.withOpacity(.8),
      content: Wrap(
        children: [
          Container(
            alignment: Alignment.center,
            // margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 20),
            child:Column(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height:45,
                  width: 45,
                  margin: EdgeInsets.only(top: 10),
                  child: CircularProgressIndicator(
                    backgroundColor: awsStartColor,
                    color: awsEndColor,
                    strokeWidth: 6,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child:Text(
                    message,
                    style: const TextStyle(fontSize: 25,),
                  ),
                ),

              ],
            ),
          )
        ],
        // child: VerificationScreen(),
      ),
      barrierDismissible: false,
      radius: 10.0);
}