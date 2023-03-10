
import 'package:bijoy_tech_quiz_app/view/pdf_view_page.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/before_join_quiz/general_indevidual_quiz_about_page_controller.dart';
import '../../controller/before_join_quiz/video_indevidual_quiz_about_page_controller.dart';
import '../../controller/pdf_view_page_controller.dart';
import '../../controller/quiz_start_page_controller.dart';
import '../../controller/video_player_page_controller.dart';
import '../../quiz_start_page.dart';
import '../common/toast.dart';
import '../video_player.dart';




class VideoIndividualQuizAboutPageScreen  extends StatelessWidget{

  final videoIndividualQuizAboutPagePageController = Get.put(VideoIndividualQuizAboutPagePageController());
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor:  backGroundColor,

          body: LayoutBuilder(builder: (context,constraints){
           return _buildBodyDesign();
          },)
      ),
    );
  }

  Widget _buildBodyDesign() {
    return Container(
      color: bg_top_color,
      child: Flex(
        direction: Axis.vertical,
        children: [

          Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Flex(direction: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20,right: 20),
                    child: InkResponse(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
                  Obx(() =>  Text(
                    videoIndividualQuizAboutPagePageController.quizName.value,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    softWrap: false,
                    maxLines:1,
                  ))
                ],
              )


          ),

          Expanded(
            child: _buildBottomDesign(),
          ),

        ],
      ),
    );
  }

  Widget _buildBottomDesign() {
    return Container(
        width: Get.size.width,
        decoration:  const BoxDecoration(
          color: bottom_bg_color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child:
        Column(
          children: [
            Expanded(child: Padding(
                padding:
                const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
                child:Obx(() => Column(
                  children: [
                    if(videoIndividualQuizAboutPagePageController.screenAvailableInfo.value=="1")...{
                      Expanded(child: SingleChildScrollView(
                        child: Column(
                          children:  [

                            Obx(() =>  ListView.builder(
                                itemCount:videoIndividualQuizAboutPagePageController.activeBooksList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                // gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                //     crossAxisCount:2,
                                //     // crossAxisCount:Get.size.width>550? 2:1,
                                //     crossAxisSpacing: 0.0,
                                //
                                //     mainAxisSpacing: 10.0,
                                //    mainAxisExtent:Get.size.width>550? 350:260
                                // ),
                                itemBuilder: (BuildContext context, int index) {
                                  return  quizListItem(
                                      item_marginLeft: 10, item_marginRight: 10,
                                      nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg',
                                      activeBooksResponse: videoIndividualQuizAboutPagePageController.activeBooksList[index]);
                                })),


                          ],
                        ),
                      ))
                    }
                    else if(videoIndividualQuizAboutPagePageController.screenAvailableInfo.value=="2")...{

                      const Expanded(child:  Center(
                        child:Text(

                          "This quiz is not available for your grade!\nThe quiz is coming soon for your grade.\nPlease try again later!",
                          textAlign: TextAlign.center,

                          style: TextStyle(
                              color: textColor,
                              fontSize: 16
                          ),
                        ),
                      ))

                    }
                    else...{

                        Expanded(child:  Center(
                          child:Text(
                            "Quiz Not Found!",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16
                            ),
                          ),
                        ))

                      }

                  ],
                ))





              // Center(
              //   child:SingleChildScrollView(
              //     child: Obx(() => Column(
              //       children:  [
              //
              //         if(generalIndividualQuizAboutPagePageController.screenAvailableInfo.value=="1")...{
              //
              //           if(generalIndividualQuizAboutPagePageController.activeBangla.value=="1")...{
              //
              //             _buildQuizCardItem(item_marginLeft: 10, item_marginRight: 10,
              //                 imageLink: 'assets/images/general_quiz.jpg', language: 'Bangla'),
              //           },
              //           if(generalIndividualQuizAboutPagePageController.activeEnglish.value=="1")...{
              //
              //             _buildQuizCardItem(item_marginLeft: 10, item_marginRight: 10,
              //                 imageLink: 'assets/images/general_quiz.jpg', language: 'English'),
              //           },
              //
              //         }
              //         else if(generalIndividualQuizAboutPagePageController.screenAvailableInfo.value=="1")...{
              //
              //           if(generalIndividualQuizAboutPagePageController.activeBangla.value=="1")...{
              //
              //             _buildQuizCardItem(item_marginLeft: 10, item_marginRight: 10,
              //                 imageLink: 'assets/images/general_quiz.jpg', language: 'Bangla'),
              //           },
              //           if(generalIndividualQuizAboutPagePageController.activeEnglish.value=="1")...{
              //
              //             _buildQuizCardItem(item_marginLeft: 10, item_marginRight: 10,
              //                 imageLink: 'assets/images/general_quiz.jpg', language: 'English'),
              //           },
              //
              //         }
              //         else...{
              //
              //           Container(
              //
              //
              //           )
              //
              //           }
              //
              //       ],
              //     )),
              //   ),
              // )

            )),

          ],
        ),



    );
  }

  Widget  quizListItem({
    required var activeBooksResponse,
    required double item_marginLeft,required double item_marginRight,
    required String nameText, required String imageLink, }){
    return Column(
      children: [

        _buildQuizCardItem(item_marginLeft: 10, item_marginRight: 10,
            nameText: activeBooksResponse["title"].toString(),
            imageLink: 'assets/images/general_quiz.jpg', activeVideoResponse: activeBooksResponse),




      ],
    );

  }

  Widget _buildQuizCardItem({required var activeVideoResponse,required double item_marginLeft,required double item_marginRight,
    required String nameText, required String imageLink, }) {
    return Column(
      children: [
        Container(
          margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom: 10,top: 10),
          // width: 180,
          decoration: BoxDecoration(
            color:home_item_bg_color,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [BoxShadow(

              color:bg_top_color,
              //  blurRadius: 20.0, // soften the shadow
              blurRadius:0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset:
              Offset(
                0.0,
                0.0,
              ),
            )],
          ),
          //   height: 150,
          child: Container(
            margin: const EdgeInsets.only(right: 00.0,top: 0,bottom: 0,left: 00),
            // height: double.infinity,
            // width: double.infinity,

            child: Center(
              child: Column(
                children: [

                  Stack(children: [
                    Row(
                      children: [
                        Expanded(child:   ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            // height: double.infinity,
                            // width: double.infinity,
                              height:Get.size.width<550?Get.size.width/3.2 :Get.size.width/3.2 ,
                              color:Colors.white,
                              child:Container(
                                color: Colors.deepOrangeAccent,
                                child:  FadeInImage.assetNetwork(
                                  // height:Get.size.width<550?Get.size.width/3.2 :Get.size.width/3.2 ,
                                  // width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/images/empty.png',
                                  // image:BASE_URL_HOME_IMAGE+videoIndividualQuizAboutPagePageController.quizImageLink.toString(),
                                  image:getYoutubeThumbnail(activeVideoResponse['video'].toString()),
                                  imageErrorBuilder: (context, url, error) =>
                                      Image.asset(
                                        'assets/images/empty.png',
                                        fit: BoxFit.fill,
                                      ),
                                ),
                              )),

                        )

                        )
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(child:   ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            // height: double.infinity,
                            // width: double.infinity,
                              height:Get.size.width<550?Get.size.width/3.2 :Get.size.width/3.2 ,
                              color:Colors.transparent,
                              child: Align(
                                alignment: Alignment.center,
                                child:  Image.asset(
                                  height:40,
                                  width:40,
                                  'assets/images/youtube_icon.png',
                                  fit: BoxFit.fill,
                                ),
                              ),),

                        )

                        )
                      ],
                    ),
                  ],),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      nameText.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color:Colors.white,
                          fontSize: sizeReturn(40),
                          fontWeight: FontWeight.bold),
                      softWrap: false,
                      maxLines:1,
                    ),
                  ),
                  const SizedBox(height: 15,),

                  Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Expanded(child: _buildQuizItemBottomText(name: 'Language:', value:activeVideoResponse['language'].toString()),),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: _buildQuizItemBottomText(name: 'Total Question:', value: videoIndividualQuizAboutPagePageController.totalQuestion.value),)
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(child: _buildQuizItemBottomText(name: 'Every Question Mark:', value: videoIndividualQuizAboutPagePageController.everyQuestionMark.value),),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+videoIndividualQuizAboutPagePageController.priceMoney.value),)
                          ],
                        ),


                        Row(
                          children: [
                            Expanded(child:  _buildQuizItemBottomText(name: 'Price Money Will Get:', value:videoIndividualQuizAboutPagePageController.priceMoneyWillGet.value+' Top Scorer'),),

                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child:  _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$'+videoIndividualQuizAboutPagePageController.topEachPersonWillGet.value),),

                          ],
                        ),






                      ],
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 0),
                    child: Row(children: const [
                      Text(
                        'About This Quiz',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color:recentTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        softWrap: false,
                        maxLines:1,
                      ),
                    ],),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                      child:  Row(
                        children: [
                          Expanded(child: ExpandableText(
                            activeVideoResponse['description'].toString(),
                            expandText: '  show more',
                            collapseText: '  show less',
                            maxLines: 3,
                            textAlign: TextAlign.start,
                            linkColor: Colors.blue,
                            animation: true,
                            linkStyle : const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13
                            ),
                            style: const TextStyle(
                                color:textColor,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ))
                        ],
                      )


                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10,top: 00,left: 10,right: 10),
                    child: Row(
                      children: [

                        Expanded(child: _buildWatchVideoButton(activeVideoResponse),),
                        SizedBox(width: 10,),
                        Expanded(child: _buildStartQuizButton(activeVideoResponse),),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ) ,
        ),


      ],
    );
  }


  Future<void> _launchUrl(String videoLink) async {
    final Uri _url = Uri.parse(videoLink);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  Widget _buildQuizItemBottomText({required String name,required String value}) {
    return  Row(
      children:  [
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:smallTextColor,
              fontSize:Get.size.width<320?12: 15,
              fontWeight: FontWeight.w500),
          softWrap: false,
          maxLines:1,
        ),
        SizedBox(width: 5,),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:greenColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          softWrap: false,
          maxLines:1,
        ),
      ],
    );
  }

  Widget _buildStartQuizButton(var activeVideoResponse) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

          showStartQuizWarning(activeVideoResponse);


        },

        child:Container(
          decoration: BoxDecoration(
              color: buttonBgColor,

              borderRadius: BorderRadius.circular(5.0)
          ),
          height:Get.size.height/16,
          // width: 100,
          alignment: Alignment.center,
          child:  Wrap(
            children:  const [
              Text(
                "Start Quiz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize:16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWatchVideoButton(var activeVideoResponse) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

          final uri = Uri.parse(activeVideoResponse["video"].toString());
          Get.to(() => VideoPlayerPageScreen(), arguments: {
            "videoId": uri.queryParameters['v'].toString(),
          })?.then((value) => Get.delete<VideoPlayerPageController>());

        },

        child:Container(
          decoration: BoxDecoration(
              color: buttonBgColor,

              borderRadius: BorderRadius.circular(5.0)
          ),
          height:Get.size.height/16,
          // width: 100,
          alignment: Alignment.center,
          child:  Wrap(
            children:  [
              Text(
                "Watch Video",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize:15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  double sizeReturn(int divide){
    return Get.size.height/divide;
  }

  String getYouTubeVideoId(String url) {
    RegExp regExp = RegExp(r'(?:(?:\?|&)v=|\/embed\/)([a-zA-Z0-9_-]{11}).*');
    Match match = regExp.firstMatch(url) as Match;
    return match.group(1).toString();
  }

  String getYoutubeThumbnail(String videoUrl) {
    final uri = Uri.parse(videoUrl);
    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  void showStartQuizWarning(var activeVideoResponse) {

    Get.defaultDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: bottom_bg_color,
        //  title: '',
        titleStyle: TextStyle(fontSize: 0),
        // backgroundColor: Colors.white.withOpacity(.8),
        content:  Container(


            child:   Center(
              child: Column(
                children: [

                  Container(

                    margin:EdgeInsets.only(right:00.0,top: 0,left: 00,
                      bottom: 0,
                    ),
                    child:Image.asset(
                      "assets/images/info_icon.png",
                      color: Colors.yellow,
                      // color: sohojatri_color,
                      // width: 81,
                      height: 40,
                      width: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                    child:  const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Attention Please!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
                    child:  const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "If you start the quiz then you could not go to the previous page. "
                            "You should first watch the video and then start the quiz.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: smallTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),


                  Row(children: [
                    Expanded(child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0,top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();

                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        child: Ink(

                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [sohojatri_color, sohojatri_color],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(7.0)
                          ),
                          child: Container(

                            height: 40,
                            alignment: Alignment.center,
                            child:  Text(
                              "Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'PT-Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),),
                    Expanded(child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0,top: 20),
                      child: ElevatedButton(
                        onPressed: () {

                          Get.back();

                          Get.to(() => QuizStartPageScreen(), arguments: {

                            "quizId": activeVideoResponse["quiz_id"].toString(),
                            "quizTypeStatus": videoIndividualQuizAboutPagePageController.quizStatus.value,
                            "bookId": activeVideoResponse["id"].toString(),
                            "language": activeVideoResponse["language"].toString(),

                          })?.then((value) => Get.delete<QuizStartPageScreenController>());



                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        child: Ink(

                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [sohojatri_color, sohojatri_color],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(7.0)
                          ),
                          child: Container(

                            height: 40,
                            alignment: Alignment.center,
                            child:  const Text(
                              "Start",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'PT-Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),),

                  ],)



                ],
              ),
            )

        ),
        barrierDismissible: false,
        radius: 10.0);
  }

}


