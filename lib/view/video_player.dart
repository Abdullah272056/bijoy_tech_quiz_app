
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controller/video_player_page_controller.dart';

class VideoPlayerPageScreen  extends StatelessWidget{

  final videoPlayerPageController = Get.put(VideoPlayerPageController());
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return Scaffold(

      body: Column(
        children: <Widget>[
          Expanded(
            child: YoutubePlayer(

              controller: videoPlayerPageController.controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              progressColors: const ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.redAccent,
              ),

            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}


