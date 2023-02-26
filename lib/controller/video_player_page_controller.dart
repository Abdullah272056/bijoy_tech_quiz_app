
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api_service/api_service.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../../static/Colors.dart';
import '../../view/common/loading_dialog.dart';
import '../../view/common/toast.dart';

class VideoPlayerPageController extends GetxController {



  var userName="".obs;
  var userToken="".obs;
  var videoId="".obs;


  dynamic argumentData = Get.arguments;


  @override
  void onInit() {
     videoId(argumentData["videoId"].toString());


    super.onInit();

  }

  late  YoutubePlayerController controller =YoutubePlayerController(
   // initialVideoId: videoId.value,
   initialVideoId: argumentData["videoId"].toString(),
    // initialVideoId: 'bi2OPrRwSTk',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      loop: true,

      // showVideoSuggestions: false,
    ),
  );
}