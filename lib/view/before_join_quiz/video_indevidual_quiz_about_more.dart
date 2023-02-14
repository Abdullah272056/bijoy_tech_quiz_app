
import 'package:bijoy_tech_quiz_app/view/pdf_view_page.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/before_join_quiz/general_indevidual_quiz_about_page_controller.dart';
import '../../controller/before_join_quiz/video_indevidual_quiz_about_page_controller.dart';
import '../../controller/pdf_view_page_controller.dart';
import '../../controller/quiz_start_page_controller.dart';
import '../../quiz_start_page.dart';
import '../common/toast.dart';




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
        child:Column(
          children: [
            Expanded(child: Padding(
                padding:
                const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
                child:SingleChildScrollView(
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
                )

            )),

          ],
        ));
  }

  Widget  quizListItem({
    required var activeBooksResponse,
    required double item_marginLeft,required double item_marginRight,
    required String nameText, required String imageLink, }){
    return Column(
      children: [

        _buildQuizCardItem(item_marginLeft: 10, item_marginRight: 10,
            nameText: activeBooksResponse["title"].toString(),
            imageLink: 'assets/images/general_quiz.jpg', activeBooksResponse: activeBooksResponse),




      ],
    );

  }

  Widget _buildQuizCardItem({required var activeBooksResponse,required double item_marginLeft,required double item_marginRight,
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
                              height:Get.size.width<550?Get.size.width/3.2 :Get.size.width/3.2 ,
                              color:Colors.white,
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: 'assets/images/empty.png',
                                image:BASE_URL_HOME_IMAGE+videoIndividualQuizAboutPagePageController.quizImageLink.toString(),
                                imageErrorBuilder: (context, url, error) =>
                                    Image.asset(
                                      'assets/images/empty.png'
                                      ,
                                      fit: BoxFit.fill,
                                    ),
                              )),

                        )

                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(child:Align(alignment: Alignment.topRight,
                    //       child: InkWell(
                    //         onTap: (){
                    //           showToastShort("more details");
                    //
                    //         },
                    //         child: Container(
                    //
                    //           decoration:  BoxDecoration(
                    //               borderRadius: BorderRadius.only(
                    //                 bottomLeft: Radius.circular(5.0),
                    //               ),
                    //               color: Colors.black.withOpacity(.25)
                    //
                    //           ),
                    //           padding: const EdgeInsets.only(left: 3,right: 3,top: 3,bottom: 3),
                    //           child: Icon(
                    //             Icons.info_outline,
                    //             color: Colors.white,
                    //             size: sizeReturn(40),
                    //           ),
                    //
                    //
                    //         ),
                    //       ),
                    //     )   )
                    //   ],
                    // ),
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
                            Expanded(child: _buildQuizItemBottomText(name: 'Language:', value:activeBooksResponse['language'].toString()),),
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
                            activeBooksResponse['description'].toString(),
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

                        Expanded(child: _buildWatchVideoButton(),),
                        SizedBox(width: 10,),
                        Expanded(child: _buildStartQuizButton(),),

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

  Widget _buildStartQuizButton() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {
          // Get.to(() => QuizStartPageScreen(), arguments: {
          //   // "categoriesId": response["id"].toString(),
          //   // "categoriesId": response["id"].toString(),
          // })?.then((value) => Get.delete<QuizStartPageScreenController>());



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

  Widget _buildWatchVideoButton() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {
          // Get.to(() => PdfViewPageScreen(), arguments: {
          //   // "categoriesId": response["id"].toString(),
          //   // "categoriesId": response["id"].toString(),
          // })?.then((value) => Get.delete<PdfViewPageScreenController>());

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
}


