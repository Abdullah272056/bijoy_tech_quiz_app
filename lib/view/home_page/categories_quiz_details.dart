
import 'package:bijoy_tech_quiz_app/view/common/toast.dart';
import 'package:bijoy_tech_quiz_app/view/home_page/quiz_about_more.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/before_join_quiz/general_indevidual_quiz_about_page_controller.dart';
import '../../controller/before_join_quiz/reading_indevidual_quiz_about_page_controller.dart';
import '../../controller/before_join_quiz/spelling_indevidual_quiz_about_page_controller.dart';
import '../../controller/before_join_quiz/video_indevidual_quiz_about_page_controller.dart';
import '../../controller/categories_quiz_details_page_controller.dart';
import '../../controller/dash_board_page_controller.dart';
import '../../controller/indevidual_quiz_about_page_controller.dart';
import '../../controller/quiz_about_more.dart';
import '../before_join_quiz/general_quiz_about_more.dart';
import '../before_join_quiz/individual_quiz_about_more.dart';
import '../before_join_quiz/reading_indevidual_quiz_about_more.dart';
import '../before_join_quiz/spelling_indevidual_quiz_about_more.dart';
import '../before_join_quiz/video_indevidual_quiz_about_more.dart';
import '../common/login_warning.dart';
import 'dash_board_page.dart';

class CategoriesQuizDetailsPageScreen  extends StatelessWidget {

  final categoriesQuizDetailsPageController = Get.put(CategoriesQuizDetailsPageController());
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
        },

        )
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
            margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),

            child: Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(width: 20,),
              InkWell(

                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 27.0,
                ),
                onTap: (){
                  Get.back();
                },
              ),
              SizedBox(width: 20,),
              Expanded(child:Obx(() =>  Text(
                categoriesQuizDetailsPageController.titleName.value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(
                    color:textColor,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500),
              )),),


              SizedBox(width:10,),
              InkWell(
                onTap: (){

                  Get.deleteAll();
                  Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());
                },
                child:Icon(Icons.home,size: 22,
                  color: Colors.white,
                ) ,
              ),
              SizedBox(width:15,),
              InkWell(
                onTap: (){

                  Get.to(() => QuizAboutPageScreen(), arguments: {
                    "categoriesId": categoriesQuizDetailsPageController.quizId.toString(),
                    "categoriesQuizName": categoriesQuizDetailsPageController.titleName.toString(),
                    "categoriesImg":  categoriesQuizDetailsPageController.imageUrl.toString(),
                  })?.then((value) => Get.delete<QuizAboutPageController>());

                },
                child:Icon(Icons.info_outline,size: 22,
                  color: Colors.white,
                ) ,
              ),
              SizedBox(width: 20,),
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
        child: Padding(
            padding:
            const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
            child:Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [

                if(categoriesQuizDetailsPageController.onGoingQuizList.isNotEmpty)...{
                  Expanded(child:SingleChildScrollView(
                    child: Column(
                      children:  [

                        Obx(() =>  ListView.builder(
                            itemCount:categoriesQuizDetailsPageController.onGoingQuizList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),

                            itemBuilder: (BuildContext context, int index) {

                              return _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,
                                  //  nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg',
                                  response: categoriesQuizDetailsPageController.onGoingQuizList[index]);
                              return _buildOnGoingQuizItem(response: categoriesQuizDetailsPageController.onGoingQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );


                            })),
                        // if(categoriesQuizDetailsPageController.onGoingQuizList.length>0)...{
                        //
                        //   Row(
                        //     children: [
                        //       Expanded(child: Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(padding: EdgeInsets.only(left: 0,top: 10),
                        //           child:  Row(
                        //             children: [
                        //               Text(
                        //                 'ONGOING QUIZ',
                        //                 overflow: TextOverflow.ellipsis,
                        //                 style: TextStyle(
                        //                     color:recentTextColor,
                        //                     fontSize: 18,
                        //                     fontWeight: FontWeight.w600),
                        //                 softWrap: false,
                        //                 maxLines:1,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),),
                        //
                        //
                        //       Container(
                        //         margin:  const EdgeInsets.only(left: 10.0, right: 5.0,top: 5,),
                        //         child: InkResponse(
                        //           onTap: (){
                        //
                        //
                        //
                        //           },
                        //           child: Image.asset(
                        //             "assets/images/arrow_right.png",
                        //             color: levelTextColorWhite,
                        //             width: 27,
                        //             height: 27,
                        //             fit: BoxFit.fill,
                        //           ),
                        //         ),
                        //
                        //       )
                        //     ],
                        //   ),
                        //
                        //
                        //
                        //   Container(
                        //       margin: const EdgeInsets.only(top: 10),
                        //       // height:Get.size.width<450?255:260,
                        //       height:Get.size.width>450?360:317,
                        //
                        //       // child: _buildRecentlyAddedCourseItem(),
                        //       child: Align(
                        //         alignment: Alignment.center,
                        //         child: Obx(() => ListView.builder(
                        //           padding: EdgeInsets.only(left: 0,top: 0,bottom: 0),
                        //           scrollDirection: Axis.horizontal,
                        //           itemCount:categoriesQuizDetailsPageController.onGoingQuizList.length,
                        //           itemBuilder: (context, index) {
                        //             if(index!=categoriesQuizDetailsPageController.onGoingQuizList.length-1){
                        //               return _buildOnGoingQuizItem(response: categoriesQuizDetailsPageController.onGoingQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );
                        //             }else{
                        //               return _buildOnGoingQuizItem(response: categoriesQuizDetailsPageController.onGoingQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );
                        //             }
                        //           },
                        //
                        //         )),
                        //       )
                        //   ),
                        //
                        //
                        // },
                        //
                        // if(categoriesQuizDetailsPageController.recentlyFinishedQuizList.length>0)...{
                        //   Padding(padding: EdgeInsets.only(left: 0,top: 20),
                        //     child:  Row(
                        //       children: [
                        //         Expanded(child: Align(
                        //           alignment: Alignment.topLeft,
                        //           child: Padding(padding: EdgeInsets.only(left: 0,top: 10),
                        //             child:  Row(
                        //               children: [
                        //                 Text(
                        //                   'RECENTLY FINISHED QUIZ',
                        //                   overflow: TextOverflow.ellipsis,
                        //                   style: TextStyle(
                        //                       color:recentTextColor,
                        //                       fontSize: 18,
                        //                       fontWeight: FontWeight.w600),
                        //                   softWrap: false,
                        //                   maxLines:1,
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),),
                        //
                        //
                        //         Container(
                        //           margin:  const EdgeInsets.only(left: 10.0, right: 5.0,top: 5,),
                        //           child: InkResponse(
                        //             onTap: (){
                        //
                        //
                        //
                        //             },
                        //             child: Image.asset(
                        //               "assets/images/arrow_right.png",
                        //               color: levelTextColorWhite,
                        //               width: 27,
                        //               height: 27,
                        //               fit: BoxFit.fill,
                        //             ),
                        //           ),
                        //
                        //         )
                        //
                        //       ],
                        //     ),
                        //   ),
                        //   Container(
                        //       margin: const EdgeInsets.only(top: 10),
                        //       // height:Get.size.width<450?255:260,
                        //       height:Get.size.width>450?300:285,
                        //
                        //
                        //
                        //       // child: _buildRecentlyAddedCourseItem(),
                        //       child: Obx(() => ListView.builder(
                        //         padding: EdgeInsets.only(left: 0,top: 0,bottom: 0),
                        //         scrollDirection: Axis.horizontal,
                        //         //  shrinkWrap: true,
                        //         // physics: const NeverScrollableScrollPhysics(),
                        //         // itemCount:homeController.homeDataList[index]["sub_categories"][index1]["products"].isNotEmpty||
                        //         //     homeController.homeDataList[index]["sub_categories"][index1]["products"].length>0?
                        //         // homeController.homeDataList[index]["sub_categories"][index1]["products"].length:0,
                        //         itemCount:categoriesQuizDetailsPageController.recentlyFinishedQuizList.length,
                        //         itemBuilder: (context, index) {
                        //           if(index!=6){
                        //             return _buildRecentlyFinishedQuizItem(response: categoriesQuizDetailsPageController.recentlyFinishedQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );
                        //
                        //           }else{
                        //             return _buildRecentlyFinishedQuizItem(response: categoriesQuizDetailsPageController.recentlyFinishedQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );
                        //           }
                        //
                        //
                        //
                        //
                        //
                        //         },
                        //
                        //       ))
                        //   ),
                        // },
                        //
                        //

                        SizedBox(height: 30,)

                      ],
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

                },


                // Container(
                //   margin: EdgeInsets.only(left: 10,right: 10),
                //   width: double.infinity,
                //   height: Get.size.height * 0.21,
                //
                //   decoration:  BoxDecoration(
                //
                //     borderRadius: BorderRadius.circular(18),
                //   ),
                //   child:  ClipRRect(
                //     borderRadius: BorderRadius.circular(10.0),
                //     child: Container(
                //         height:Get.size.width<550?Get.size.width/2.7 :Get.size.width/2.7 ,
                //         color:Colors.white,
                //         child:  Obx(() => FadeInImage.assetNetwork(
                //           fit: BoxFit.cover,
                //           placeholder: 'assets/images/empty.png',
                //           image:categoriesQuizDetailsPageController.imageUrl.value,
                //           imageErrorBuilder: (context, url, error) =>
                //               Image.asset(
                //                 "assets/images/empty.png",
                //
                //                 fit: BoxFit.fill,
                //               ),
                //         ))),
                //
                //   ),
                // ),
                // // Container(
                // //   margin: EdgeInsets.only(left: 10,right: 10),
                // //   width: double.infinity,
                // //   height: Get.size.height * 0.21,
                // //
                // //   decoration:  BoxDecoration(
                // //
                // //     borderRadius: BorderRadius.circular(18),
                // //   ),
                // //   child:  ClipRRect(
                // //     borderRadius: BorderRadius.circular(10.0),
                // //     child: Container(
                // //         height:Get.size.width<550?Get.size.width/2.7 :Get.size.width/2.7 ,
                // //         color:Colors.white,
                // //         child:  FadeInImage.assetNetwork(
                // //           fit: BoxFit.cover,
                // //           placeholder: 'assets/images/empty.png',
                // //           image:"https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80",
                // //           imageErrorBuilder: (context, url, error) =>
                // //               Image.asset(
                // //                 "assets/images/empty.png",
                // //
                // //                 fit: BoxFit.fill,
                // //               ),
                // //         )),
                // //
                // //   ),
                // // ),
                // SizedBox(height: 10,),
                //
                // Row(
                //   children: [
                //     Expanded(child: Obx(()=> Text(
                //       categoriesQuizDetailsPageController.quizName.value,
                //       // 'General Quiz Competition',
                //       textAlign: TextAlign.center,
                //       overflow: TextOverflow.ellipsis,
                //       softWrap: false,
                //       maxLines: 2,
                //       style: TextStyle(
                //           color:forgottenPasswordTextColor,
                //           fontSize: 20,
                //           decoration: TextDecoration.none,
                //           fontWeight: FontWeight.w700),
                //     )))
                //   ],
                // ),
                //
                // SizedBox(height: 10,),
                // Obx(() => ExpandableText(
                //     categoriesQuizDetailsPageController.quizAboutText.value,
                //   expandText: '  show more',
                //   collapseText: '  show less',
                //   maxLines: 7,
                //   linkColor: Colors.blue,
                //   animation: true,
                //   linkStyle : const TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 13
                //   ),
                //   style: const TextStyle(
                //       color:textColor,
                //       fontSize: 15,
                //       fontWeight: FontWeight.normal),
                // ),),
                //
                //



              ],
            )),

        ));
  }

  Widget _buildHomeCardItem({required var response,required double item_marginLeft,required double item_marginRight,  }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));
      },
      child: Container(
        margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom: 10,top: 10),
        // width: 180,
        decoration: BoxDecoration(
          color:home_item_bg_color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(

            color:bg_top_color,
            //  blurRadius: 20.0, // soften the shadow
            blurRadius:0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset:
            Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )],
        ),
        //   height: 150,
        child: Container(
          margin: const EdgeInsets.only(right: 00.0,top: 0,bottom: 0,left: 00),
          // height: double.infinity,
          // width: double.infinity,

          child: Center(
            child:
            Column(
              children: [

                Row(
                  children: [
                    Expanded(child:   ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height:120 ,
                          color:Colors.white,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/empty.png',
                            image:categoriesQuizDetailsPageController.imageUrl.toString(),
                            imageErrorBuilder: (context, url, error) =>
                                Image.asset(
                                  'assets/images/empty.png',
                                  fit: BoxFit.fill,
                                ),
                          )),

                    )

                    )
                  ],
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child:Text(
                    response["title"].toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:forgottenPasswordTextColor,
                        fontSize: sizeReturn(40),
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),),

                Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: Column(
                    children: [



                      _buildQuizItemBottomText(name: 'Quiz Start Time:', value: dateFormat(response["start_date"].toString()),),
                      _buildQuizItemBottomText(name: 'Quiz End Time:', value: dateFormat(response["end_date"].toString())+" "+
                          response["end_time"].toString(),),
                      _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+response["price"].toString()),
                      _buildQuizItemBottomText(name: 'Total Winner:', value: response["person"].toString()),



                      _buildQuizItemBottomText(name: '1st Top Scorer Will Get:',
                          value: response["first_top_money"].toString()!="null"?"\$"+response["first_top_money"].toString():"\$"+"0.00"
                      ),

                      _buildQuizItemBottomText(name: '2nd Top Scorer Will Get:',
                          value: response["second_top_money"].toString()!="null"?"\$"+response["second_top_money"].toString():"\$"+"0.00"
                      ),

                      _buildQuizItemBottomText(name: '3rd Top Scorer Will Get:',
                          value: response["third_top_money"].toString()!="null"?"\$"+response["third_top_money"].toString():"\$"+"0.00"
                      ),

                      _buildQuizItemBottomText(name: 'Total Question:', value: response["total_quistion"].toString()),
                      _buildQuizItemBottomText(name: 'Every Question Mark:', value: response["mark"].toString()),





                    ],
                  ),
                ),



                _buildContinueButton(response),

              ],
            ),

            // Column(
            //   children: [
            //
            //     Stack(children: [
            //       Row(
            //         children: [
            //           Expanded(child:   ClipRRect(
            //             borderRadius: BorderRadius.circular(10.0),
            //             child: Container(
            //                 height:Get.size.width<550?Get.size.width/3.2 :Get.size.width/3.2 ,
            //                 color:Colors.white,
            //                 child: FadeInImage.assetNetwork(
            //                   fit: BoxFit.cover,
            //                   placeholder: 'assets/images/empty.png',
            //                   image:BASE_URL_HOME_IMAGE+response["home_content"]["img"].toString(),
            //
            //                   imageErrorBuilder: (context, url, error) =>
            //                       Image.asset(
            //                         'assets/images/empty.png',
            //                         fit: BoxFit.fill,
            //                       ),
            //                 )),
            //
            //           )
            //
            //           )
            //         ],
            //       ),
            //
            //     ]),
            //     SizedBox(height: 10,),
            //     Align(
            //       alignment: Alignment.topCenter,
            //       child: Text(
            //         response["title"].toString(),
            //         // nameText.toString(),
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(
            //             color:Colors.white,
            //             fontSize: sizeReturn(40),
            //             fontWeight: FontWeight.bold),
            //         softWrap: false,
            //         maxLines:1,
            //       ),
            //     ),
            //     const SizedBox(height: 10,),
            //
            //
            //     Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
            //       child: Column(
            //         children: [
            //
            //
            //
            //           _buildQuizItemBottomText(name: 'Quiz Start Time:', value: dateFormat(response["start_date"].toString()),),
            //           _buildQuizItemBottomText(name: 'Quiz End Time:', value: dateFormat(response["end_date"].toString())+" "+
            //               response["end_time"].toString(),),
            //           _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+response["price"].toString()),
            //           _buildQuizItemBottomText(name: 'Total Winner:', value: response["person"].toString()),
            //
            //
            //
            //           _buildQuizItemBottomText(name: '1st Top Scorer Will Get:',
            //               value: response["first_top_money"].toString()!="null"?"\$"+response["first_top_money"].toString():"\$"+"0.00"
            //           ),
            //
            //           _buildQuizItemBottomText(name: '2nd Top Scorer Will Get:',
            //               value: response["second_top_money"].toString()!="null"?"\$"+response["second_top_money"].toString():"\$"+"0.00"
            //           ),
            //
            //           _buildQuizItemBottomText(name: '3rd Top Scorer Will Get:',
            //               value: response["third_top_money"].toString()!="null"?"\$"+response["third_top_money"].toString():"\$"+"0.00"
            //           ),
            //
            //           _buildQuizItemBottomText(name: 'Total Question:', value: response["total_quistion"].toString()),
            //           _buildQuizItemBottomText(name: 'Every Question Mark:', value: response["mark"].toString()),
            //
            //
            //           // _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+response["price"].toString()),
            //           // _buildQuizItemBottomText(name: 'Price Money Will Get:', value: response["person"].toString()),
            //           // // _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$20.00'),
            //           // _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$'+response["each_person_get"].toString()),
            //
            //
            //         ],
            //       ),
            //     ),
            //
            //   //  _buildJoinQuizButton(response)
            //
            //
            //   ],
            // ),
          ),
        ) ,
      ),

    );
  }

  String dateFormat(String dateString){

    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd-MM-yyyy');
    // var outputFormat = DateFormat('dd-MMM-yyyy');
    // var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }


  Widget _buildRecentlyFinishedQuizItem({
    required var response,
    required double height,
    required double width,
    required double marginLeft,
    required double marginRight,
  }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child:

      Container(
        margin:  EdgeInsets.only(left: marginLeft, right: marginRight,bottom: 0,top: 0),
        width: width*.7,
        decoration: BoxDecoration(
          color:home_item_bg_color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(

            color:bg_top_color,
            //  blurRadius: 20.0, // soften the shadow
            blurRadius:0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset:
            Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )],
        ),
        //   height: 150,
        child: Container(
          margin: const EdgeInsets.only(right: 00.0,top: 0,bottom: 0,left: 00),
          height: double.infinity,
          width: double.infinity,


          child: Center(
            child: Column(
              children: [

                Row(
                  children: [
                    Expanded(child:   ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height:120 ,
                          color:Colors.white,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/empty.png',
                            image:categoriesQuizDetailsPageController.imageUrl.toString(),
                            imageErrorBuilder: (context, url, error) =>
                                Image.asset(
                                  'assets/images/empty.png',

                                  fit: BoxFit.fill,
                                ),
                          )),

                    )

                    )
                  ],
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child:Text(
                    response["title"].toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:forgottenPasswordTextColor,
                        fontSize: sizeReturn(40),
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),),

                const SizedBox(height: 15,),


                Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: Column(
                    children: [

                      _buildQuizItemBottomText(name: 'Total Question:', value: response["total_quistion"].toString()),
                      _buildQuizItemBottomText(name: 'Every Question Mark:', value:  response["mark"].toString()),
                      _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+ response["price"].toString()),
                      _buildQuizItemBottomText(name: 'Price Money Will Get:', value:response["person"].toString()+ ' Top Scorer'),
                      _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$'+response["each_person_get"].toString()),
                      // Obx(() => _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$sdfvgbn'),),








                    ],
                  ),
                )

              ],
            ),
          ),
        ) ,
      ),



    );
  }


  Widget _buildOnGoingQuizItem({
    required var response,
    required double height,
    required double width,
    required double marginLeft,
    required double marginRight,
  }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child:

      Container(
        margin:  EdgeInsets.only(left: marginLeft, right: marginRight,bottom: 0,top: 0),
        width: width*.7,
        decoration: BoxDecoration(
          color:home_item_bg_color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(

            color:bg_top_color,
            //  blurRadius: 20.0, // soften the shadow
            blurRadius:0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset:
            Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )],
        ),
        //   height: 150,
        child: Container(
          margin: const EdgeInsets.only(right: 00.0,top: 0,bottom: 0,left: 00),
          height: double.infinity,
          width: double.infinity,


          child: Center(
            child: Column(
              children: [

                Row(
                  children: [
                    Expanded(child:   ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height:120 ,
                          color:Colors.white,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/empty.png',
                            image:categoriesQuizDetailsPageController.imageUrl.toString(),
                            imageErrorBuilder: (context, url, error) =>
                                Image.asset(
                                    'assets/images/empty.png',
                                  fit: BoxFit.fill,
                                ),
                          )),

                    )

                    )
                  ],
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child:Text(
                    response["title"].toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:forgottenPasswordTextColor,
                        fontSize: sizeReturn(40),
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),),

               Expanded(child:  Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Padding(padding: EdgeInsets.only(left: 12,right: 12,bottom: 10,top: 10),
                     child: Column(
                       children: [

                         _buildQuizItemBottomText(name: 'Total Question:', value: response["total_quistion"].toString()),
                         _buildQuizItemBottomText(name: 'Every Question Mark:', value:  response["mark"].toString()),
                         _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+ response["price"].toString()),
                         _buildQuizItemBottomText(name: 'Price Money Will Get:', value:response["person"].toString()+ ' Top Scorer'),
                         _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$'+response["each_person_get"].toString()),
                         // Obx(() => _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$sdfvgbn'),),








                       ],
                     ),
                   )
                 ],
               ),),

                _buildContinueButton(response),

              ],
            ),
          ),
        ) ,
      ),



    );
  }


  Widget _buildContinueButton( var response) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

         // showToastShort(categoriesQuizDetailsPageController.userToken.value);
          if(categoriesQuizDetailsPageController.userToken.value.isNotEmpty &&
              categoriesQuizDetailsPageController.userToken.value!=null &&
              categoriesQuizDetailsPageController.userToken.value!="null"
          ){
            if(categoriesQuizDetailsPageController.quizTypeStatus.value=="1"){
              Get.to(() => GeneralIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": categoriesQuizDetailsPageController.quizTypeStatus.toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<GeneralIndividualQuizAboutPagePageController>());
            }
            if(categoriesQuizDetailsPageController.quizTypeStatus.value=="2"){
              Get.to(() => SpellingIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": categoriesQuizDetailsPageController.quizTypeStatus.toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<SpellingIndividualQuizAboutPagePageController>());
            }
            if(categoriesQuizDetailsPageController.quizTypeStatus.value=="3"){
              Get.to(() => ReadingIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": categoriesQuizDetailsPageController.quizTypeStatus.toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<ReadingIndividualQuizAboutPagePageController>());
            }
            if(categoriesQuizDetailsPageController.quizTypeStatus.value=="4"){
              Get.to(() => VideoIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": categoriesQuizDetailsPageController.quizTypeStatus.toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<VideoIndividualQuizAboutPagePageController>());
            }

          }else{
            showLoginWarning();
          }

        },

        child:Container(
          decoration: BoxDecoration(
              color: buttonBgColor,

              borderRadius: BorderRadius.circular(10.0)
          ),
          height:Get.size.height/18,
          // width: 100,
          alignment: Alignment.center,
          child:  Wrap(
            children:  [
              Text(
                "Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize:sizeReturn(48),
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

  Widget _buildQuizItemBottomText({required String name,required String value}) {
    return  Row(
      children:  [
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:smallTextColor,
              fontSize:Get.size.width<320?12: 16,
              fontWeight: FontWeight.w500
          ),
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


  double sizeReturn(int devide){
    return Get.size.height/devide;
  }


}


