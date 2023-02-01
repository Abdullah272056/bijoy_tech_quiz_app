import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../static/Colors.dart';

showToastShort(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: fnf_color,
      textColor: Colors.white,
      fontSize: 16.0);
}

showToastLong(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: fnf_color,
      textColor: Colors.white,
      fontSize: 16.0);
}